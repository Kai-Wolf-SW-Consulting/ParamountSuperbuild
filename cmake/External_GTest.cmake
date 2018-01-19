ExternalProject_Add(gtest
  URL ${gtest_url}
  URL_MD5 ${gtest_md5}
  INSTALL_DIR ${ParamountSuperbuild_INSTALL_PREFIX}/gtest
  CMAKE_ARGS
    -Wno-dev
    -DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS}
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    -Dgtest_force_shared_crt=ON)

ExternalProject_Get_Property(gtest install_dir)
set(GTEST_ROOT ${install_dir} CACHE INTERNAL "")

list(APPEND ParamountSuperbuild_THIRDPARTYLIBS_ARGS
  -DGTEST_ROOT:PATH=${GTEST_ROOT})
