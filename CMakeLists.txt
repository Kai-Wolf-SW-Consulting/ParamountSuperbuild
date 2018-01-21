cmake_minimum_required(VERSION 3.9 FATAL_ERROR)
project(ParamountSuperbuild VERSION 1.0 LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake
  ${CMAKE_MODULE_PATH})

# Set up project defaults
include(BuildType)
include(BuildLocation)
include(BuildUtils)
include(ExternalProject)
include(Projects)

# Set up a few default arguments for the following projects
option(BUILD_SHARED_LIBS "Build shared libraries" ON)
option(BUILD_PARAMOUNT "Build the Paramount application" ON)
option(BUILD_TESTING "Build with tests" ON)

set(ParamountSuperbuild_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/install)
set(ParamountSuperbuild_DEFAULT_ARGS
  -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
  -DBUILD_TESTING:BOOL=${BUILD_TESTING}
  -DCMAKE_PREFIX_PATH:PATH=${ParamountSuperbuild_INSTALL_PREFIX};${CMAKE_PREFIX_PATH}
  -DCMAKE_INSTALL_PREFIX:PATH=${ParamountSuperbuild_INSTALL_PREFIX})

if(CMAKE_BUILD_TYPE)
  list(APPEND ParamountSuperbuild_DEFAULT_ARGS
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE})
endif()

add_subdirectory(thirdparty)

# Now including the actual Paramount project
if(BUILD_PARAMOUNT)
  if(Paramount_deps_installed)
    include(${CMAKE_CURRENT_BINARY_DIR}/ParamountCache.cmake)
    add_subdirectory(Paramount)
  else()
    include(External_Paramount)
  endif()
endif()
