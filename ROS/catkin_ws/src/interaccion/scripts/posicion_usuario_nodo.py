#!/usr/bin/env python
#coding=utf-8
import rospy
from interaccion.msg import pos_usuario
from interaccion.msg import usuario


# 如果要写ROS节点，需要导入rospy。std_msgs.msg的目的是可以使用std_msgs/String消息类型来发布
 
def talker():
	pub = rospy.Publisher('pos_usuario_topic', pos_usuario, queue_size=10)
	rospy.init_node('posicion_usuario_nodo', anonymous=True)

	rate = rospy.Rate(10) 
	x=input("please enter posicion x:")
	y=input("please enter posicion Y:")
	z=input("please enter posicion Z:")


	while not rospy.is_shutdown():
	

		
        	rospy.loginfo('Talker: posicion: x=%f ,y= %f,z=%f',x,y,z)
        	pub.publish(pos_usuario(x,y,z))

	
		rate.sleep()
 
if __name__ == '__main__':
	try:
		talker()
	except rospy.ROSInterruptException:
		pass
