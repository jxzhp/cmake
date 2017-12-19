cmake_minimum_required(VERSION 2.8)

project(hello-curl)
set(cmake_build_type Release ON)

add_subdirectory(lib)
add_executable(hello-curl main.c)
include_directories(${PROJECT_SOURCE_DIR}/lib)
target_link_libraries(hello-curl pri)

set(CPACK_GENERATOR "DEB;RPM")
set(CPACK_PACKAGE_NAME ${PORJECT_NAME})
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libcurl3, libc6")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "kabir")    #required
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "kabir project")
set(CPACK_PACKAGE_CONTACT "jxwazxzhp@126.com")
set(CPACK_PACKAGE_VENDOR "kabir")

exec_program(
    "git" ARGS "log --pretty=\"format:%h\" -n1"
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
    )
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")
if("${rm_retval}" STREQUAL 0)
    set(CPACK_PACKAGE_VERSION_PATCH ${rm_out})
else()
    set(CPACK_PACKAGE_VERSION_PATCH 1)
endif()
set(PROJECT_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
set(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-${PROJECT_VERSION}-${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")

install(TARGETS hello-curl RUNTIME DESTINATION bin)
include(CPack)
