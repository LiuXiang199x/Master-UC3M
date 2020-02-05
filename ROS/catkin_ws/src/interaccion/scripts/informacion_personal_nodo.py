#!/usr/bin/env python
#coding=utf-8
import rospy
from interaccion.msg import inf_personal_usuario

	# 如果要写ROS节点，需要导入rospy。std_msgs.msg的目的是可以使用std_msgs/String消息类型来发布
 
def talker():
	pub = rospy.Publisher('inf_pers_topic', inf_personal_usuario, queue_size=10)
	rospy.init_node('informacion_personal_nodo', anonymous=True)

	rate = rospy.Rate(10) 

	edad = input("please enter your age:")
	nombre = str(input("please enter your name:"))
	idiomas = str(input("please enter your language:"))

	while not rospy.is_shutdown():

		rospy.loginfo("Informacion: nombre = %s ,edad = %d , idiomas = %s",nombre,edad,idiomas)
		pub.publish(inf_personal_usuario(nombre,edad,idiomas))

		rate.sleep()


 
if __name__ == '__main__':
	try:
		talker()
	except rospy.ROSInterruptException:
		pass

