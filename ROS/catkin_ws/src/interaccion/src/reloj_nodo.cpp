#include "ros/ros.h"
#include "std_msgs/Bool.h"
#include "std_msgs/String.h"
#include "boost/date_time/posix_time/posix_time.hpp"
#include <iostream>

using namespace std;
using namespace boost::posix_time;
using namespace boost::gregorian;

bool start = false;

ptime begin;
ptime actual;

ros::Publisher publicadorAlive;

ptime getLocalTime()
{
	ptime aux = second_clock::local_time();
	return aux;
}

//obtener fecha UTC
ptime getUTC()
{
	//get time
	ptime aux = second_clock::universal_time();
	return aux;
}

//funcion manejadora topic 'start_topic'
void startCallback(const std_msgs::String::ConstPtr& msg)
{
	ROS_INFO("start!");
	start = true;
	//get Time
	begin = getLocalTime();
}

//funcion manejadora topic 'reset_topic'
void resetCallback(const std_msgs::String::ConstPtr& msg)
{
	ROS_INFO("reset!");

	begin = getLocalTime();
}


void timerCallback(const ros::TimerEvent&)
{
	std_msgs::Bool msg;
	msg.data = true;

	publicadorAlive.publish(msg);
}


int main(int arcg, char **argv)
{
	//inicia nodo
	ros::init(arcg, argv, "reloj_nodo");
	ros::NodeHandle nodo;
	ROS_INFO("reloj_nodo creado y registrado");


	ros::Subscriber subscriptor_start = nodo.subscribe("start_topic", 0, startCallback);
	ros::Subscriber subscriptor_reset = nodo.subscribe("reset_topic", 0, resetCallback);
	ros::Timer timer = nodo.createTimer(ros::Duration(10), timerCallback);
	publicadorAlive = nodo.advertise<std_msgs::Bool>("still_alive", 0);

	//ratio 3[seg]
	ros::Rate rate(0.33);

	//inicio de bucle
	while(ros::ok())
	{

		if(start)
		{

			actual = getLocalTime();
			ROS_INFO_STREAM("Hora local actual:\t" << actual);
			ROS_INFO_STREAM("Hora UTC actual:  \t" << getUTC());
			ROS_INFO_STREAM("Tiempo desde Start/Reset: " << (actual - begin));
		}

		ros::spinOnce();
		rate.sleep();
	}
}
