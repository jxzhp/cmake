add_library(pri SHARED lib.c)
add_library(pri_static STATIC lib.c)

set_target_properties(pri_static PROPERTIES OUTPUT_NAME "pri")
set_target_properties(pri PROPERTIES VERSION 1.2 SOVERSION 1)

find_package(CURL)
IF(CURL_FOUND)
    include_directories(${CURL_INCLUDE_DIR})
    target_link_libraries(pri ${CURL_LIBRARY})
ELSE()
    message(FATAL_ERROR "CURL library not found")
ENDIF()


install(TARGETS  pri pri_static
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    )
install(FILES lib.h DESTINATION include)
