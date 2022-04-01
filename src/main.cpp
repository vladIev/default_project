#include "func.h"

#include <spdlog/spdlog.h>
#include <opencv2/highgui.hpp>
#include <iostream>

int main(int argc, char** argv) {
    spdlog::info("Hello world");
    cv::Mat img = load_img("D:/photo/1Oy455E04lI.jpg");
    cv::imshow("TEST", img);
    cv::waitKey(0);
    return 0;
}