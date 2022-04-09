#pragma once
#include <chrono>
#include <thread>
/* 
@file 
@brief just example of file with doxygen comments
*/

/*
@brief fucntion descrtiption 
@param arg description
*/
void some_function(int some_arg) {
	std::this_thread::sleep_for(std::chrono::seconds(some_arg));
}