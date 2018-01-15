cmake_minimum_required(VERSION 3.9 FATAL_ERROR)
project(ParamountSuperbuild VERSION 1.0 LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake
  ${CMAKE_MODULE_PATH})

# Set up project defaults
include(BuildType)
include(ExternalProject)
include(Projects)

# Set up a few default arguments for the following projects
option(BUILD_SHARED_LIBS "Build shared libraries" ON)
option(BUILD_BOOST "Build with Boost library" ON)
option(BUILD_QT "Build with Qt5 framework" ON)
option(BUILD_GTEST "Build with GTest library" ON)

set(ParamountSuperbuild_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/install)
set(ParamountSuperbuild_DEFAULT_ARGS
  -DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS}
  -DCMAKE_PREFIX_PATH:${ParamountSuperbuild_INSTALL_PREFIX};${CMAKE_PREFIX_PATH}
  -DCMAKE_INSTALL_PREFIX:${ParamountSuperbuild_INSTALL_PREFIX})

if(CMAKE_BUILD_TYPE)
  list(APPEND ParamountSuperbuild_DEFAULT_ARGS
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE})
endif()

if(BUILD_BOOST)
  include(External_Boost)
endif()

if(BUILD_QT)
  include(External_Qt)
endif()

if(BUILD_GTEST)
  include(External_GTest)
endif()
