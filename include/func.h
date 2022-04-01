#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>

inline cv::Mat load_img(std::string_view path) {
	return cv::imread("D:/photo/1Oy455E04lI.jpg");
}