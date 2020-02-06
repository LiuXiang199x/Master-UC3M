// e01_hsv.cpp: HSV histograms
#include "opencv\cv.hpp"
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char* argv[])
{
	// Object instantiation
	Mat color_img, hsv_img;
	// Load image from disk

	color_img = imread("mandril_c.jpg", CV_LOAD_IMAGE_COLOR);
	if (!color_img.data) {
		cout << "error loading image" << endl;
		return 1;
	}
	// convert from bgr to hsv
	cvtColor(color_img, hsv_img, CV_BGR2HSV);
	// Split channels
	Mat h_channel(hsv_img.size(), CV_8UC1);
	Mat s_channel(hsv_img.size(), CV_8UC1);
	Mat v_channel(hsv_img.size(), CV_8UC1);
	Mat array_channels[] = { h_channel, s_channel, v_channel };
	split(hsv_img, array_channels);


	/// Calcular el histograma para cada canal
	// Initialize histogram parameters
	/// Establish the number of bins
	int histSize = 256;
	/// Set the ranges (for B, G, R)
	float range[] = { 0,256 };
	const float* histRange = { range };

	// Calculate histogram
	Mat h_hist, s_hist, v_hist;
	calcHist(&h_channel, 1, 0, Mat(), h_hist, 1, &histSize, &histRange, true, false);
	calcHist(&s_channel, 1, 0, Mat(), s_hist, 1, &histSize, &histRange, true, false);
	calcHist(&v_channel, 1, 0, Mat(), v_hist, 1, &histSize, &histRange, true, false);

	/// Preparar la imagen para mostrar los hitograms
	// Plot hitogram
	int hist_w = 512; int hist_h = 400;
	int bin_w = cvRound((double)hist_w / histSize);
	Mat histImage(hist_h, hist_w, CV_8UC3, Scalar(0, 0, 0));

	// Normalize the result to [ 0, histImage.rows ]
	normalize(h_hist, h_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat());
	normalize(s_hist, s_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat());
	normalize(v_hist, v_hist, 0, histImage.rows, NORM_MINMAX, -1, Mat());

	/// Draw for each channel
	for (int i = 1; i < histSize; i++)
	{
		line(histImage, Point(bin_w * (i - 1), hist_h - cvRound(h_hist.at<float>(i - 1))),
			Point(bin_w * (i), hist_h - cvRound(h_hist.at<float>(i))),
			Scalar(255, 0, 0), 2, 8, 0);
		line(histImage, Point(bin_w * (i - 1), hist_h - cvRound(s_hist.at<float>(i - 1))),
			Point(bin_w * (i), hist_h - cvRound(s_hist.at<float>(i))),
			Scalar(0, 255, 0), 2, 8, 0);
		line(histImage, Point(bin_w * (i - 1), hist_h - cvRound(v_hist.at<float>(i - 1))),
			Scalar(0, 0, 255), 2, 8, 0);

	/// Mostrar todas las imagenes, liberar memoria y finalizar el programa
	namedWindow("color", CV_WINDOW_AUTOSIZE);
	namedWindow("H", CV_WINDOW_AUTOSIZE);
	namedWindow("S", CV_WINDOW_AUTOSIZE);
	namedWindow("V", CV_WINDOW_AUTOSIZE);
	namedWindow("histogram: Red=H Green=S Blue=V", CV_WINDOW_AUTOSIZE);

	// Show image in the name of the window
	imshow("color", color_img);
	imshow("H", b_channel);
	imshow("S", color_img);
	imshow("V", color_img);
	imshow("histogram: Red=H Green=S Blue=V", histImage);

	// Function for show the image in ms.
	waitKey(0);
	// Free memory
	destroyAllWindows();
	// End of the program
	return 0;
}



