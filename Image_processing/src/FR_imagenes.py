# -*- coding: utf-8 -*-
"""
Created on Thu Nov 21 21:51:04 2019

referencias

1.- https://www.academia.edu/7613945/Newborns_Face_Recognition_Role_of_Inner_and_Outer_Facial_Features
2.- https://www.researchgate.net/publication/2716938_Face_Recognition_through_Geometrical_Features
3.- http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.722.9654&rep=rep1&type=pdf

@author: The Great Cephalopod
"""

import cv2 as cv
import numpy as np

def getFaces(net, img, conf_thershold = 0.7):
    """
    Gets the bounding boxes of the detected faces in the image "img" with the CNN "net".
    """
    oImg = img.copy()
    
    imgH = img.shape[0]
    imgW = img.shape[1]
    
    conf_threshold = 0.7
    
    blob = cv.dnn.blobFromImage(oImg, 1.0, (300, 300), [104, 117, 123], True, False)
    net.setInput(blob)
    detections = net.forward()
    
    """
    Gets the bounding boxes of the detected faces in the image "img" with the CNN "net".
    """
    for i in range(detections.shape[2]):
        
        confidence = detections[0, 0, i, 2]

        if confidence > conf_threshold:

            x1 = int(detections[0, 0, i, 3] * imgW)

            y1 = int(detections[0, 0, i, 4] * imgH)

            x2 = int(detections[0, 0, i, 5] * imgW)

            y2 = int(detections[0, 0, i, 6] * imgH)
            
            bboxes.append([x1, y1, x2, y2])
            
            cv.rectangle(oImg, (x1, y1), (x2, y2), (255, 0, 0), int(round(imgH/150)), 1)
            
    return oImg, bboxes

def CNN_Age_Gender(img, faceImg, bboxes, ageNet, genderNet):
    """
    Age&Gender clasificacion for the faces found in the picture
    """  
    MODEL_MEAN_VALUES = (78.4263377603, 87.7689143744, 114.895847746)
    ageList = ['(0-2)', '(4-6)', '(8-12)', '(15-20)', '(25-32)', '(38-43)', '(48-53)', '(60-100)']
    genderList = ['Male', 'Female'] 
    
    padding = 20
    results = []
    if not bboxes:
        print("No face Detected in image.")
        return False 
    else:            
        for i in range( len(bboxes) ):
            
            bbox = bboxes[i]
            
            face = img[ max(0,bbox[1]-padding):min(bbox[3]+padding,img.shape[0]-1),
                       max(0,bbox[0]-padding):min(bbox[2]+padding,img.shape[1]-1)]
            
            ## Feeding the GenderNet with face image 
            blob = cv.dnn.blobFromImage(face, 1.0, (227, 227), MODEL_MEAN_VALUES, swapRB=False)
            genderNet.setInput(blob)
            genderPreds = genderNet.forward()
            gender = genderList[genderPreds[0].argmax()]
            results.append([gender])
            
            ## Feeding the AgeNet with face image
            ageNet.setInput(blob)
            agePreds = ageNet.forward()
            age = ageList[agePreds[0].argmax()]
            results[i].append(age)
            label = "{},{}".format(gender, age)
            cv.putText(faceImg, label, (bbox[0], bbox[1]-10), cv.FONT_HERSHEY_TRIPLEX, 0.5, (255, 255, 255), 2, cv.LINE_AA)
        
        return results, face

def menuInit():
    
    print("-------------------------------")
    print("----Bienvenido a Ticketes------")
    print("-------------------------------")
    entry = input("¿Desea comprar un ticket?[Y/n]")
    
    if(entry.lower() == 'y'):
        return True
    else:
        return False

def calcPay(results, rate = 5.00):
    
    price = 0.0
    total = 0.0
    
    for res in results:
        
        age = res[1]
        
        if( age == '(0-2)'):
            price = rate*0.0
            
        elif( age == '(4-6)'):
            price = rate*0.2
            
        elif( age == '(8-12)'):
            price = rate*0.4
            
        elif( age == '(15-20)'):
            price = rate*0.8
            
        elif( age == '(60-100)'):
            price = rate*0.2
        else:
            price = rate
        
        total = total + price
        res.append(price)
    
    return results, total
        
def readImage(filename):
    
    img  = cv.imread(filename)    
    img2 = img.copy()   
    
    return img, img2


   
bboxes = []
imgFile = 'C:/Users/olivi/Desktop/models/c.jpg'


if __name__ == '__main__':
    
    """
    Read the CNNs for face, age and gender clasification.
    """
    faceProto = "C:/Users/olivi/Desktop/models/opencv_face_detector.pbtxt"
    faceModel = "C:/Users/olivi/Desktop/models/opencv_face_detector_uint8.pb"

    ageProto = "C:/Users/olivi/Desktop/models/age_deploy.prototxt"
    ageModel = "C:/Users/olivi/Desktop/models/age_net.caffemodel"

    genderProto = "C:/Users/olivi/Desktop/models/gender_deploy.prototxt"
    genderModel = "C:/Users/olivi/Desktop/models/gender_net.caffemodel"
    
    """
    Initialize the CNNs as a dnn object.
    """  
    faceNet = cv.dnn.readNet(faceModel, faceProto)
    genderNet = cv.dnn.readNet(genderModel, genderProto)
    ageNet = cv.dnn.readNet(ageModel, ageProto)
    
    """
    Menu for tickets
    """
    if( menuInit() == True):
        """
        Image input
        """
        img, img2  = readImage(imgFile)    
        """
        Face detection using CNNs
        """   
        faceImg, bboxes = getFaces(faceNet,img2)
    
        """
        Age&Gender clasificacion for the faces found in the picture
        """   
        results, face = CNN_Age_Gender( img, faceImg, bboxes, ageNet, genderNet)
        print("")
        print("La camara ha detectado " + str(len(results)) + " personas.")
        keyIn = input("¿Es esto correcto?[Y/n]")
        
        while(True):
            if(keyIn.lower() == 'y'):
        
                results, total = calcPay(results)                
                break
            elif(keyIn.lower() == 'n'):
                
                results = []
                bboxes = []
                
                keyIn = input("Escriba el nombre de la imagen:")
                
                img, img2 = readImage(keyIn)
                faceImg, bboxes = getFaces(faceNet,img2)
                results, face = CNN_Age_Gender( img, faceImg, bboxes, ageNet, genderNet)
                print("")
                print("La camara ha detectado " + str(len(results)) + " personas.")
                keyIn = input("¿Es esto correcto?[Y/n]")
        
            else:
                print("Opcion invalida.")
                continue
        
        print("El coste de sus tickets es {:.2f}€".format(total))
        cv.imshow("img_original", img)
        cv.imshow("img_dnn", faceImg)
        cv.imshow("face", face)
        
        cv.waitKey(0)
        cv.destroyAllWindows()
        
        """
        
        """
    else:    
        """
        Image output
        """
    print("Tenga un buen día.")
    
  
