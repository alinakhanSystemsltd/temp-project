cmake_minimum_required(VERSION 3.17)

set(MOSAIQ_PROJECT_NAME "mosaiqruntimeprojectname")
set(MOSAIQ_PROJECT_DEB_DEPENDENCIES "")
set(MOSAIQ_PROJECT_CONAN_REQUIREMENTS 
  gtest/1.10.0)
#docker run -it --name mosaiqxx --mount type=bind,source="$(pwd)"/template-project,target=/app,readonly runtime-tooling

set(MOSAIQ_VENDOR "encoway GmbH - New Automation Technologies")
set(MOSAIQ_CONTACT "none@right.now")

project(${MOSAIQ_PROJECT_NAME} 
    VERSION 0.1.0
    LANGUAGES CXX
)
include(cmake/ProjectSettings.cmake)

add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_20)

add_library(project_warnings INTERFACE)
#Warnings
include(cmake/CompilerWarnings.cmake)
set_project_warnings(project_warnings)

#Sanitizer
include(cmake/Sanitizers.cmake)
enable_sanitizers(project_options)

#Static Analysis
include(cmake/StaticAnalyzers.cmake)


option(ENABLE_TESTING "Enable Test Builds" ON)

#Conan
set(CONAN_REQUIRES
  ${MOSAIQ_PROJECT_CONAN_REQUIREMENTS}  
)
set(CONAN_OPTIONS "")

include(cmake/Conan.cmake)
run_conan()

#Testing
if(ENABLE_TESTING)
  enable_testing()
  message(
    "Building Tests."
  )
  add_subdirectory(test)
endif()

add_subdirectory(src)

include(cmake/PackageSettings.cmake)
