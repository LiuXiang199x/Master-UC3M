#include "opencv2\opencv.hpp"
#include "opencv2\imgcodecs\legacy\constants_c.h"
#include <opencv2/highgui/highgui_c.h>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char* argv[])
{
	// Objects
	Mat original_img;
	Mat filtered_img(original_img.size(), original_img.type());

	// Load image from disk
	original_img = imread("googleCar.jpg", CV_LOAD_IMAGE_GRAYSCALE);
	if (!original_img.data) {
		cout << "error loading image" << endl;
		return 1;
	}

	/// Reduce noise with a kernel 3x3
	//blur(original_img, original_img, Size(3, 3));

	// Canny: 2:1 3x3
	int low_threshold = 50;
	int high_threshold = low_threshold * 2;
	int kernel_size = 3;
	Canny(original_img, filtered_img, low_threshold, high_threshold, kernel_size);

	// Windows for all the images
	namedWindow("Original picture", CV_WINDOW_AUTOSIZE);
	namedWindow("Filtered picture", CV_WINDOW_AUTOSIZE);

	// Show image in the name of the window
	imshow("Original picture", original_img);
	imshow("Filtered picture", filtered_img);
	// Function for show the image in ms.
	waitKey(0);

	// Free memory
	original_img.release();
	filtered_img.release();
	destroyAllWindows();
	// End of the program
	return 0;


}