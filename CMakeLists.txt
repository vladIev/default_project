cmake_minimum_required(VERSION 3.0.0)
project(default_project VERSION 0.1.0)

include(CTest)
enable_testing()

find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
endif()
    
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
list(APPEND CMAKE_PREFIX_PATH "${CMAKE_BINARY_DIR}")
    
include(CommonCompileFlags)
include(${CMAKE_CURRENT_LIST_DIR}/cmake/ConanInstall.cmake)
prepare_conan()
#if (CMAKE_BUILD_TYPE STREQUAL Release)
#    set(CONAN_BUILD_DIR "${CMAKE_CURRENT_LIST_DIR}/conan/release")
#    set(CONAN_BUILD_TYPE Release)
#else()
#    set(CONAN_BUILD_DIR "${CMAKE_CURRENT_LIST_DIR}/conan/debug")
#    set(CONAN_BUILD_TYPE Debug)
#endif()
#execute_process(COMMAND conan install ${CMAKE_CURRENT_LIST_DIR}/conan/ --build=missing -s build_type=${CONAN_BUILD_TYPE}
#                WORKING_DIRECTORY ${CONAN_BUILD_DIR})
#include("${CONAN_BUILD_DIR}/conanbuildinfo.cmake")
#conan_basic_setup()

add_subdirectory(src)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  include(CTest)
  if(BUILD_TESTING)
    add_subdirectory(test)
  endif()
endif()
