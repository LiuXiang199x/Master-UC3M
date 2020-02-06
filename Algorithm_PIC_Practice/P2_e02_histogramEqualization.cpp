#include "opencv2\opencv.hpp"
#include "opencv2\imgcodecs\legacy\constants_c.h"
#include <opencv2/highgui/highgui_c.h>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char* argv[])
{
	// Object
	Mat original_img, equalized_img;

	// Load image = imread("rayosx.tif", CV_LOAD_IMAGE_GRAYSCALE);
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
	Mat equalizedHistImage(hist_h, hist_w, CV_8UC3, Scalar(0, 0, 0));

	// Calculate histogram
	Mat original_hist, normalized_hist, equalized_hist, equalized_normalized_hist;
	calcHist(&original_img, 1, 0, Mat(), original_hist, 1, &histSize, &histRange, true, false);

	// Print the values of the original histogram on console
	cout << "Original histogram" << endl;
	for (int h = 0; h < histSize; h++)
	{
		float binVal = original_hist.at<float>(h);
		cout << " " << binVal;
	}
	cout << endl;

	/// Normalize the result to [ 0,histImage .rows ]
	normalize(original_hist, normalized_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat());

	// Print the values on console
	cout << "Normalized histogram" << endl;
	for (int h = 0; h < histSize; h++)
	{
		float binVal = normalized_hist.at<float>(h);
		cout << " " << binVal;
	}
		cout << endl;

		// Equalize histogram from a grayscale image
		equalizeHist(original_img, equalized_img);
		calcHist(&equalized_img, 1, 0, Mat(), equalized_hist, 1, &histSize, &histRange, true, false);

		// Print the values on console
		cout << "Euqalized histogram" << endl;
		for (int h = 0; h < histSize; h++)
		{
			float binVal = normalized_hist.at<float>(h);
			cout << " " << binVal;
		}
		cout << endl;

		// Equalize histogram from a grayscale image
		equalizeHist(original_img, equalized_img);
		calcHist(&equalized_img, 1, 0, Mat(), equalized_hist, 1, &histSize, &histRange, true, false);

		// Print the values on console
		cout << " Equalized histogram" << endl;
		for (int h = 0; h < histSize; h++)
		{
			float binVal = equalized_hist.at<float>(h);
			cout << " " << binVal;
		}
		cout << endl;

		// Normalize the equalized histogram to fit in the histogram image
		normalize(equalized_hist, equalized_normalized_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat());

		// Print the values on console
		cout << " Equalized normalied histogram" << endl;
		for (int h = 0; h < histSize; h++)
		{
			float binVal = equalized_normalized_hist.at<float>(h);
			cout << " " << binVal;
		}
		cout << endl;

		/// Plot histograms
		for (int i = 1; i < histSize; i++)
		{
			// Line of width 2 (bin_w = 512 width / 256 gray scale values) filled
			line(histImage,
				Point(bin_w * (i), hist_w),
				Point(bin_w * (i), hist_h - cvRound(normalized_hist.at<float>(i))),
				Scalar(255, 0, 0), bin_w, 8, 0);
			line(equalizedHistImage,
				Point(bin_w * (i), hist_w),
				Point(bin_w * (i), hist_h - cvRound(equalized_normalized_hist.at<float>(i))),
				Scalar(0, 255, 0), bin_w, 8, 0);
		}
		// Windows for all the images
		namedWindow("Original picture", CV_WINDOW_AUTOSIZE);
		namedWindow("Equalized picture", CV_WINDOW_AUTOSIZE);
		namedWindow("Original histogram", CV_WINDOW_AUTOSIZE);
		namedWindow("Equalized histogram", CV_WINDOW_AUTOSIZE);
		// Show image in the name of the window
		imshow("Original picture", original_img);
		imshow("Equalized picture", equalized_img);
		imshow("Original histogram", histImage);
		imshow("Equalized histogram", equalizedHistImage);
		// Function for show the image in ms.
		waitKey(0);
		// Free memory
		original_img.release();
		equalized_img.release();
		histImage.release();
		equalized_img.release();
		original_hist.release();
		normalized_hist.release();
		equalized_normalized_hist.release();
		destroyAllWindows();
		// End of the program
		return 0;

}