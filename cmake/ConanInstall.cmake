macro(prepare_conan)
    find_program(CONAN_PROGRAM conan)
    if (CONAN_PROGRAM)
        message("Conan was found. Starting installation")
        if (CMAKE_BUILD_TYPE STREQUAL Release)
            set(CONAN_BUILD_DIR "${CMAKE_CURRENT_LIST_DIR}/conan/release")
            set(CONAN_BUILD_TYPE Release)
        else()
            set(CONAN_BUILD_DIR "${CMAKE_CURRENT_LIST_DIR}/conan/debug")
            set(CONAN_BUILD_TYPE Debug)
        endif()

        if (NOT EXISTS ${CONAN_BUILD_DIR})
            file(MAKE_DIRECTORY ${CONAN_BUILD_DIR})
        endif()
        execute_process(COMMAND conan install ${CMAKE_CURRENT_LIST_DIR}/conan/ --build=missing -s build_type=${CONAN_BUILD_TYPE}
                        WORKING_DIRECTORY ${CONAN_BUILD_DIR})
        include("${CONAN_BUILD_DIR}/conanbuildinfo.cmake")
        conan_basic_setup()
    else()
        message("ERROR. conan not found")
    endif()

endmacro()