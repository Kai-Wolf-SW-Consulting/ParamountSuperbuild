if(NOT USE_SYSTEM_BOOST)
  list(APPEND deps boost)
endif()

if(NOT USE_SYSTEM_QT)
  list(APPEND deps qt5)
endif()

if(NOT USE_SYSTEM_GTEST)
  list(APPEND deps gtest)
endif()

ExternalProject_Add(Paramount
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Paramount
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -E echo
    "Generating cache script for Paramount..."
  BUILD_COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_COMMAND} ${CMAKE_CURRENT_SOURCE_DIR}
  INSTALL_COMMAND ""
  DEPENDS ${deps})

set(cache_script ${CMAKE_CURRENT_BINARY_DIR}/ParamountCache.cmake)
set(cache_args ${ParamountSuperbuild_DEFAULT_ARGS}
    ${ParamountSuperbuild_THIRDPARTYLIBS_ARGS})
write_cmake_cache_file("${cache_script}" "${cache_args}")
set(Paramount_deps_installed TRUE CACHE BOOL "")