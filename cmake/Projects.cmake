unset(PROJECTS)

# Boost
list(APPEND PROJECTS boost)
set(_v 60)
set(boost_version 1.${_v}.0)
set(boost_url "http://sourceforge.net/projects/boost/files/boost/1.${_v}.0/boost_1_${_v}_0.tar.gz/download")
set(boost_md5 "28f58b9a33469388302110562bdf6188")

# Qt
list(APPEND PROJECTS qt)
set(qt_version "5.10.0")
string(REGEX MATCH "^[0-9]+\.[0-9]+" qt_major ${qt_version})
set(qt_url "http://download.qt.io/official_releases/qt/${qt_major}/${qt_version}/single/qt-everywhere-src-${qt_version}.tar.xz")
set(qt_md5 "c5e275ab0ed7ee61d0f4b82cd471770d")

# GTest
list(APPEND PROJECTS gtest)
set(gtest_version "1.8.0")
set(gtest_url "https://github.com/google/googletest/archive/release-${gtest_version}.tar.gz")
set(gtest_md5 "16877098823401d1bf2ed7891d7dce36")
