cmake_minimum_required(VERSION 2.8)

project(hello-curl)

set(cmake_build_type Release ON)
message(STATUS "This is BINARY dir " ${PROJECT_BINARY_DIR})
message(STATUS "This is SOURCE dir " ${PROJECT_SOURCE_DIR})


add_subdirectory(lib)
add_executable(hello-curl main.c)
include_directories(${PROJECT_SOURCE_DIR}/lib)

target_link_libraries(hello-curl pri)

set(CPACK_GENERATOR "DEB")
set(CPACK_PACKAGE_NAME ${PORJECT_NAME})
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libcurl3, libc6")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "kabir")    #required
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "kabir project")
set(CPACK_PACKAGE_CONTACT "jxwazxzhp@126.com")
set(CPACK_PACKAGE_VENDOR "kabir")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-1.1-${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")
install(TARGETS hello-curl RUNTIME DESTINATION bin)
include(CPack)
