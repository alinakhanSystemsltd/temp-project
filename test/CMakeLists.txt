include(GoogleTest)
 
add_executable(${PROJECT_NAME}-tests tests.cpp)
target_link_libraries(${PROJECT_NAME}-tests PRIVATE project_warnings project_options CONAN_PKG::gtest)
gtest_discover_tests(
    ${PROJECT_NAME}-tests
)
