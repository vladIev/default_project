
add_executable(main main.cpp)
target_link_libraries(main ${CONAN_LIBS})
target_include_directories(
    main PUBLIC $<INSTALL_INTERFACE:include>
                     $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>)
target_compile_features(main PRIVATE cxx_std_20)
