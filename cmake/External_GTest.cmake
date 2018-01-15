ExternalProject_Add(gtest
  URL ${gtest_url}
  URL_MD5 ${gtest_md5}
  INSTALL_DIR ${ParamountSuperbuild_INSTALL_PREFIX}/gtest
  CMAKE_ARGS
    -Wno-dev
    -DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS}
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    -Dgtest_force_shared_crt=ON)
