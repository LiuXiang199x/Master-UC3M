// e01_Separar la imagen de color
//
#include "opencv2\opencv.hpp"
#include <iostream>
#include "opencv2\imgcodecs\legacy\constants_c.h"
#include <opencv2/highgui/highgui_c.h>

using namespace cv;
using namespace std;

int main(int argc, char* argv[])
{
	// Object
	Mat color_img;
	// Load image from disk
	Mat color_image = imread("mandril_c.jpg", CV_LOAD_IMAGE_COLOR);
	if (!color_img.data) {
		cout << "error loading image" << endl;
		return 1;
	}
	// change from bgr to rgb
	cvtColor(color_image, color_image, CV_BGR2RGB);
	// Split color image. Required containers
	Mat r_channel(color_image.size(), CV_8UC1);
	Mat g_channel(color_image.size(), CV_8UC1);
	Mat b_channel(color_image.size(), CV_8UC1);
	Mat array_channels[] = { r_channel, g_channel, b_channel };
	split(color_image, array_channels);
	// Create window canvas to show image
	namedWindow("color", CV_WINDOW_AUTOSIZE);
	namedWindow("R", CV_WINDOW_AUTOSIZE);
	namedWindow("G", CV_WINDOW_AUTOSIZE);
	namedWindow("B", CV_WINDOW_AUTOSIZE);
	// Show image in the name of the window
	imshow("color", color_img);
	imshow("R", r_channel);
	imshow("G", g_channel);
	imshow("B", b_channel);
	// Function for show the image in ms
	waitKey(0);
	// Free memory
	destroyAllWindows();
	// End of the program
	return 0;
}