macro(run_conan)
# Download automatically, you can also just copy the conan.cmake file
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(
    STATUS
      "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
       "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

#conan_add_remote(NAME conan-center URL
#                 http://nat01.encowayhb.lokal:8081/repository/conan/)
#conan_add_remote (Name mosaiq URL http://localhost:8082/artifactory/api/conan/mosaiq-local) 

conan_cmake_run(
  REQUIRES
  ${CONAN_REQUIRES}
  OPTIONS
  ${CONAN_OPTIONS}
  BASIC_SETUP
  CMAKE_TARGETS # individual targets to link to
  BUILD
  missing)
endmacro()
