cmake_minimum_required(VERSION 2.8)

project(hello-world)

set(cmake_build_type Release ON)
message(STATUS "This is BINARY dir " ${PROJECT_BINARY_DIR})
message(STATUS "This is SOURCE dir " ${PROJECT_SOURCE_DIR})


add_subdirectory(lib)
add_executable(hello-world main.c)
include_directories(${PROJECT_SOURCE_DIR}/lib)

find_package(CURL)
IF(CURL_FOUND)
    include_directories(${CURL_INCLUDE_DIR})
    target_link_libraries(hello-world ${CURL_LIBRARY})
ELSE()
    message(FATAL_ERROR "CURL library not found")
ENDIF()

target_link_libraries(hello-world pri)

install(TARGETS hello-world RUNTIME DESTINATION bin)
