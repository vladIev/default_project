macro(prepare_conan)
    if (CMAKE_BUILD_TYPE STREQUAL Release)
        set(CONAN_BUILD_DIR "${CMAKE_CURRENT_LIST_DIR}/conan/release")
        set(CONAN_BUILD_TYPE Release)
        message("CONFIG FOR RELEASE")
    else()
        set(CONAN_BUILD_DIR "${CMAKE_CURRENT_LIST_DIR}/conan/debug")
        set(CONAN_BUILD_TYPE Debug)
        message("CONFIG FOR DEBUG")
    endif()

    execute_process(COMMAND conan install ${CMAKE_CURRENT_LIST_DIR}/conan/ --build=missing -s build_type=${CONAN_BUILD_TYPE}
                    WORKING_DIRECTORY ${CONAN_BUILD_DIR})
    include("${CONAN_BUILD_DIR}/conanbuildinfo.cmake")
    conan_basic_setup()

endmacro()

