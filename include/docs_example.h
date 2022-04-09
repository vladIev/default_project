#pragma once
#include <chrono>
#include <thread>

/**
 * @file
 * @brief Description of file
 */


/**
   @brief function description
   @param arg description
 */
void some_function(int some_arg) {
	std::this_thread::sleep_for(std::chrono::seconds(some_arg));
}