#!/usr/bin/env python
#coding=utf-8
import rospy
from std_msgs.msg import String
from interaccion.msg import inf_personal_usuario
from interaccion.msg import pos_usuario
from interaccion.msg import usuario

# listener.py与talker.py文件类似，在listener中会引入一种新的基于回调机制callback来订阅消息。
 
def callback(data):
     #rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
	#rospy.loginfo('Listener: GPS: distance=%f, state=%s', distance, gps.state)     
	rospy.loginfo('Talker: posicion: x=%f ,y= %f,z=%f',x,y,z)
	rospy.loginfo(emocion_str)
	rospy.loginfo('Informacion: nombre = %s ,edad = %d , idiomas = %s',nombre,edad,idiomas)

def listener():

	rospy.init_node('empaquetador_nodo', anonymous=True)

	rospy.Subscriber("emocion_topic", String, callback)
	rospy.Subscriber("pos_usuario_topic", pos_usuario, callback)
	rospy.Subscriber("inf_pers_topic", inf_personal_usuario, callback)

 
	# spin() simply keeps python from exiting until this node is stopped
	rospy.spin()

if __name__ == '__main__':
	listener()
