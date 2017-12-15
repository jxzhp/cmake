add_library(pri SHARED lib.c)
add_library(pri_static STATIC lib.c)

set_target_properties(pri_static PROPERTIES OUTPUT_NAME "pri")
set_target_properties(pri PROPERTIES VERSION 1.2 SOVERSION 1)
install(TARGETS  pri pri_static
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    )
install(FILES lib.h DESTINATION include)
