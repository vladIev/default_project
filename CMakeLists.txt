cmake_minimum_required(VERSION 3.0.0)
project(default_project VERSION 0.1.0)

include(CTest)
enable_testing()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
list(APPEND CMAKE_PREFIX_PATH "${CMAKE_BINARY_DIR}")

option(ENABLE_CCACHE "Enable compiler cache" OFF)
if (ENABLE_CCACHE)
    include(Ccache)
    enable_ccache()
endif()

option(ENABLE_IPO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)" OFF)
option(ENABLE_BUILD_WITH_TIME_TRACE "Enable -ftime-trace to generate time tracing .json files on clang" OFF)
include(CommonCompileFlags)

#option(ENABLE_PCH "Enable Precompiled Headers" OFF)
#if (ENABLE_PCH)
#    target_precompile_headers(
#    default_project INTERFACE_AUTOUIC_OPTIONS <vector> <string> <map> <set> <iterator> <utility> <algorithm> <iostream>)
#endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmake/ConanInstall.cmake)
prepare_conan()

option(ENABLE_CLANG_TIDY "Enable static analysis with clang-tidy" OFF)
if (ENABLE_CLANG_TIDY)
    include(StaticAnalyser)
    enable_clang_tidy()
endif()

add_subdirectory(src)
add_subdirectory(doc)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  include(CTest)
  if(BUILD_TESTING)
    add_subdirectory(test)
  endif()
endif()
