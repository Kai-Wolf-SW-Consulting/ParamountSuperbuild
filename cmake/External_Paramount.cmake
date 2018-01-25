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
  CMAKE_CACHE_ARGS
    ${ParamountSuperbuild_DEFAULT_ARGS}
    ${ParamountSuperbuild_THIRDPARTYLIBS_ARGS}
  DEPENDS ${deps})

# CMake automatically generates a init cache script file for us, which we can
# use to configure this subproject via add_subdirectory()
ExternalProject_Get_property(Paramount TMP_DIR)
set(paramount_cache_script ${TMP_DIR}/Paramount-cache-${CMAKE_BUILD_TYPE}.cmake
  CACHE FILEPATH "Path to initial cache file for configuring Paramount")
