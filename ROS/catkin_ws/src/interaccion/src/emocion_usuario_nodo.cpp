#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>

using namespace std;


int main(int arcg, char **argv)
{

	ros::init(arcg, argv, "emocion_usuario_nodo");
	ros::NodeHandle nodo;
	ROS_INFO("emocion_usuario_nodo creado y registrado");


	ros::Publisher publicadorMensajes = nodo.advertise<std_msgs::String>("emocion_topic", 0);


	ros::Duration seconds_sleep(1);


	while(ros::ok())
	{

		std_msgs::String msg;
		string emocion;
		string aux;

		ROS_INFO("Introduce tus emociones (escribe 'stop' para terminar:)");
		int cont = 0;

		do{
			cin>>aux;
			if(aux.compare("stop")!=0)
			{
				if (cont==0)
				{
					emocion = aux;
				}
				else
				{
					emocion = emocion + "," + aux;
				}
			}
			cont++;
			msg.data = emocion;
		}while(aux.compare("stop")!=0);


		publicadorMensajes.publish(msg);


		ros::spinOnce();
		seconds_sleep.sleep();
	}

}
