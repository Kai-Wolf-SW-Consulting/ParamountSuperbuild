ExternalProject_Add(Paramount
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Paramount
  BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/Paramount
  CMAKE_CACHE_ARGS
    ${ParamountSuperbuild_DEFAULT_ARGS}
    ${ParamountSuperbuild_THIRDPARTYLIBS_ARGS})

