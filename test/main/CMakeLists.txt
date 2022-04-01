add_executable(unittests main.cpp)
target_compile_options(unittests PRIVATE ${BASE_COMPILE_FLAGS})
target_link_libraries(unittests PRIVATE ${CONAN_LIBS})
gtest_discover_tests(unittests)