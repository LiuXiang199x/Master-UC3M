#include "opencv2\opencv.hpp"
#include "opencv2\imgcodecs\legacy\constants_c.h"
#include <opencv2/highgui/highgui_c.h>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char* argv[])
{
	//Object instantiation
	Mat original_img, lut_img;

	// Load image from disk
	original_img = imread("backlighting2.jpg", CV_LOAD_IMAGE_GRAYSCALE);
	if (!original_img.data) {
		cout << "error loading image" << endl;
		return 1;
	}
	// Initialize histogram parameters
	/// Establish the number of bins
	int histSize = 256;
	/// Set the ranges GrayScale 0-255
	float range[] = { 0, 256 };
	const float* histRange = { range };
	/// Set histogram image
	int hist_w = 512; int hist_h = 400;
	int bin_w = cvRound((double)hist_w / histSize);
	Mat histImage(hist_h, hist_w, CV_8UC3, Scalar(0, 0, 0));
	Mat lutHistImage(hist_h, hist_w, CV_8UC3, Scalar(0, 0, 0));

	// Calculate histogram
	Mat original_hist, normalized_hist, lut_hist, lut_normalized_hist;
	calcHist(&original_img, 1, 0, Mat(), original_hist, 1, &histSize, &histRange, true, false);

	// Print the values of the original histogram on console
	cout << "Original histogram" << endl;
	for (int h = 0; h < histSize; h++)
	{
		float binVal = original_hist.at<float>(h);
		cout << " " << binVal;
	}
	cout << endl << endl;

	/// Normalize the result to [ 0, histImage.rows ]
	normalize(original_hist, normalized_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat());

	// Print the values on console
	cout << "Normalized histogram" << endl;
	for (int h = 0; h < histSize; h++)
	{
		float binVal = normalized_hist.at<float>(h);
		cout << " " << binVal;
	}
	cout << endl << endl;

	// Lut:functions from grayscale image
	Mat lut(1, 256, CV_8U);
	// Make the LUT function
	for (int i = 0; i < 256; i++) {
		// Inverse function
		lut.at<uchar>(i) = 255 - i;
		// Square root function
		//lut.at<uchar>(i) = pow((float)i * 255, (float)(1 / 2.0));
		// Cubic function
		//lut.at<uchar>(i) = pow((float)i, (float)3.0) / (255 * 255);
	}
	LUT(original_img, lut, lut_img);
	// Calculate lut histogram
	calcHist(&lut_img, 1, 0, Mat(), lut_hist, 1, &histSize, &histRange, true, false);

	//Print the values on console
	cout << "Lut histogram" << endl;
	for (int h = 0; h < histSize; h++)
	{
		float binVal = lut_hist.at<float>(h);
		cout << " " << binVal;
	}
	cout << endl << endl;

	// Normalize lut histogram to fit in the histogram image
	normalize(lut_hist, lut_normalized_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat());

	// Print the values on console
	cout << "Lut normalized histogram" << endl;
	for (int h = 0; h < histSize; h++)
	{
		float binVal = lut_normalized_hist.at<float>(h);
		cout << " " << binVal;
	}
	cout << endl << endl;

	/// Plot hidtograms
	for (int i = 1; i < histSize; i++)
	{
		// Line of width 2 (bin_w = 512 width / 256 gray scale values) filled
		line(histImage,
			Point(bin_w * (i), hist_w),
			Point(bin_w * (i), hist_h - cvRound(normalized_hist.at<float>(i))),
			Scalar(255, 0, 0), bin_w, 8, 0);
		line(lutHistImage,
			Point(bin_w * (i), hist_w),
			Point(bin_w * (i), hist_h - cvRound(normalized_hist.at<float>(i))),
			Scalar(0, 255, 0), bin_w, 8, 0);
	}
	// Windows for all the images
	namedWindow("Original picture", CV_WINDOW_AUTOSIZE);
	namedWindow("Lut picture", CV_WINDOW_AUTOSIZE);
	namedWindow("Original histogram", CV_WINDOW_AUTOSIZE);
	namedWindow("Lut histogram", CV_WINDOW_AUTOSIZE);
	// Show image in the name of the window
	imshow("Original picture", original_img);
	imshow("Lut picture", lut_img);
	imshow("Original histogram", histImage);
	imshow("Lut histogram", lutHistImage);
	// Function for show the image in ms.
	waitKey(0);
	// Free memory
	original_img.release();
	lut_img.release();
	histImage.release();
	lutHistImage.release();
	original_hist.release();
	normalized_hist.release();
	lut_hist.release();
	lut_normalized_hist.release();
	destroyAllWindows();
	// End of the program
	return 0;

}