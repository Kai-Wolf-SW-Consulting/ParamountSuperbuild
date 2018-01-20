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
  BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/Paramount
  CMAKE_CACHE_ARGS
    ${ParamountSuperbuild_DEFAULT_ARGS}
    ${ParamountSuperbuild_THIRDPARTYLIBS_ARGS}
  DEPENDS ${deps})
