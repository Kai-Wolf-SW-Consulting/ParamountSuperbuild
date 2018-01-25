# Copyright (c) 2017, Kai Wolf. All rights reserved.
# Use of this source code is governed by a personal license that can be
# found in the LICENSE file in the top directory.

option(USE_SYSTEM_BOOST "Use installed version of Boost library" OFF)
option(USE_SYSTEM_QT "Use installed version of Qt5 framework" OFF)
option(USE_SYSTEM_GTEST "Use installed version of GTest library" OFF)

if(USE_SYSTEM_BOOST)
  find_package(Boost COMPONENTS filesystem system thread REQUIRED)
  list(APPEND ParamountSuperbuild_THIRDPARTYLIBS_ARGS
    "-DBOOST_ROOT=${BOOST_ROOT}"
    "-DBoost_INCLUDE_DIR=${Boost_INCLUDE_DIR}"
    "-DBOOST_LIBRARY_DIR=${Boost_LIBRARY_DIR}")
else()
  include(External_Boost)
endif()

if(USE_SYSTEM_QT)
  find_package(Qt5 COMPONENTS Core Gui Widgets REQUIRED)
  list(APPEND ParamountSuperbuild_THIRDPARTYLIBS_ARGS
    "-DCMAKE_PREFIX_PATH=${ParamountSuperbuild_INSTALL_PREFIX};${CMAKE_PREFIX_PATH}")
else()
  include(External_Qt)
endif()

if(USE_SYSTEM_GTEST)
  find_package(GTest REQUIRED)
  list(APPEND ParamountSuperbuild_THIRDPARTYLIBS_ARGS
    "-DGTEST_ROOT=${GTEST_ROOT}")
else()
  include(External_GTest)
endif()

set(ParamountSuperbuild_THIRDPARTYLIBS_ARGS
  "${ParamountSuperbuild_THIRDPARTYLIBS_ARGS}" PARENT_SCOPE)
