#!/usr/bin/env python
#coding=utf-8
import rospy
from std_msgs.msg import String

# 如果要写ROS节点，需要导入rospy。std_msgs.msg的目的是可以使用std_msgs/String消息类型来发布
 
def talker():
	pub = rospy.Publisher('emocion_topic', String, queue_size=10)
	rospy.init_node('emocion_usuario_nodo', anonymous=True)

	rate = rospy.Rate(10) 

	while not rospy.is_shutdown():
     		emocion_str = "please enter your feeling %s"% rospy.get_time()

		rospy.loginfo(emocion_str)
		pub.publish(emocion_str)
	
		rate.sleep()
 
if __name__ == '__main__':
	try:
		talker()
	except rospy.ROSInterruptException:
		pass
