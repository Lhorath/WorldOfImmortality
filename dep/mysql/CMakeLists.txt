# This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

set(MYSQL_MIN_VERSION_MySQL 8.0.34)
set(MYSQL_MIN_VERSION_MariaDB 10.6.3)
find_package(MySQL COMPONENTS lib)

add_library(mysql INTERFACE)

target_compile_definitions(mysql
  INTERFACE
    TRINITY_MYSQL_FLAVOR="${MYSQL_FLAVOR}"
    TRINITY_REQUIRED_MYSQL_VERSION="${MYSQL_MIN_VERSION_${MYSQL_FLAVOR}}")

target_link_libraries(mysql
  INTERFACE
    MySQL::MySQL)

if(WIN32)
  function(copy_mysql_runtime target)
    get_filename_component(mysql_library_dir "${MYSQL_LIBRARY}" DIRECTORY)
    get_filename_component(mysql_library_name "${MYSQL_LIBRARY}" NAME_WE)
    set(mysql_runtime_library "${mysql_library_dir}/${mysql_library_name}.dll")

    if(NOT EXISTS "${mysql_runtime_library}")
      message(FATAL_ERROR "Could not find the MySQL runtime library: ${mysql_runtime_library}")
    endif()

    add_custom_command(TARGET ${target}
      POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${mysql_runtime_library}"
        "$<TARGET_FILE_DIR:${target}>"
      VERBATIM)
  endfunction()
endif()
