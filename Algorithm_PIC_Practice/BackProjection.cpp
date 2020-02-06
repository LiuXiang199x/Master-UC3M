// Pyramidal_LucasKanade: Optical Flow
#include "opencv\cv.hpp"
#include <iostream>

using namespace cv;
using namespace std;


int main(int argc, char* argv[])
{
	// Objects
	Mat original, hsv, hue;

	// Load image from disk
	original = imread("backproj1.png", CV_LOAD_IMAGE_COLOR );
	if (!original.data){
		cout << "error loading image" << endl;
		system("pause");
		return 1;
	}
	
	
	hsv.create(original.size(), original.depth());
	cvtColor(original, hsv, CV_BGR2HSV);
	int ch[] = { 0, 0 };
	hue.create(hsv.size(), hsv.depth());
	mixChannels(&hsv, 1, &hue, 1, ch, 1);

	// Initialize histogram parameters
	Mat hist, backproj;

	int histSize = 180;
	/// Set the ranges GrayScale 0-179
	float range[] = { 0, 179 };
	const float* histRange = { range };
	/// Set histogram image
	int hist_w = 180*2; int hist_h = 400;
	int bin_w = cvRound((double)hist_w / histSize);

	calcHist(&hue, 1, 0, Mat(), hist, 1, &histSize, &histRange);
	normalize(hist, hist, 0, 400, CV_MINMAX);

	calcBackProject(&hue, 1, 0, hist, backproj, &histRange, 1, true);

	/// Plot histogram
	Mat histImage(hist_h, hist_w, CV_8UC3);
	histImage = Mat::zeros(hist_h, hist_w, CV_8UC3);
	for (int i = 0; i < histSize; i++)
	{
		//	Line of width 2 (bin_w = 180*2 width / 180 hue scale values) filled
		line(histImage,
			Point(bin_w * i, hist_h),
			Point(bin_w * i, hist_h - cvRound(hist.at<float>(i))),
			Scalar(255, 0, 0), bin_w, 8, 0);
	}
	// Windows for all the images
	namedWindow("Color", CV_WINDOW_AUTOSIZE);
	namedWindow("HSV", CV_WINDOW_AUTOSIZE);
	namedWindow("HUE", CV_WINDOW_AUTOSIZE);
	namedWindow("histImage", CV_WINDOW_AUTOSIZE);
	namedWindow("backproj", CV_WINDOW_AUTOSIZE);

	// Show image in the name of the window
	imshow("Color", original);
	imshow("HSV", hsv);
	imshow("HUE", hue);
	imshow("histImage", histImage);
	imshow("backproj", backproj);

	// Function for show the image in ms.
	waitKey(0);

	// Free memory
	original.release();
	hsv.release();
	hue.release();
	hist.release();
	backproj.release();
	destroyAllWindows();
	// End of the program
	return 0;
}