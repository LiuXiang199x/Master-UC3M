// e01_Separar la imagen de color
//
#include "opencv2\opencv.hpp"
#include "opencv2\imgcodecs\legacy\constants_c.h"
#include <opencv2/highgui/highgui_c.h>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char* argv[])
{
	// Object
	Mat gray_img, color_img;
	// Load image from disk
	gray_img = imread("mandril.jpg", CV_LOAD_IMAGE_GRAYSCALE);
	if (!gray_img.data) {
		cout << "error laoding imgae" << endl;
		return 1;
	}
	color_img = imread("mandril_c.jpg", CV_LOAD_IMAGE_COLOR);
	if (!color_img.data) {
		cout << "error loading image" << endl;
		return 1;
	}
	cout << "gray channels; " << gray_img.channels() << endl;
	cout << "color channels;" << color_img.channels() << endl;
	// Create window canvas to show image
	namedWindow("gray", CV_WINDOW_AUTOSIZE);
	namedWindow("color", CV_WINDOW_AUTOSIZE);

	// Show image in the name of the window
	imshow("gray", gray_img);
	imshow("color", color_img);

	// Function for show the image in ms.
	waitKey(0);
	//Free memory
	destroyAllWindows();
	// End of the program
	return 0;
}