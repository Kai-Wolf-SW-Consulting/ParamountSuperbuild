set(qt_with_args
  -no-framework -opensource -confirm-license -shared -nomake examples
  -nomake tests -no-compile-examples -no-gif -no-cups
  -no-feature-movie -no-qml-debug -no-sql-db2 -no-sql-ibase
  -no-sql-mysql -no-sql-oci -no-sql-odbc -no-sql-psql -no-sql-sqlite2
  -no-sql-sqlite -no-sql-tds -no-journald -no-syslog -no-slog2 -opengl desktop
  -no-ssl -no-openssl -no-securetransport -no-libproxy -no-sctp)

if(WIN32)
  set(config_script ./configure.bat)
  list(APPEND qt_with_args -platform win32-msvc)
  find_program(NMAKE_EXECUTABLE NAMES nmake.exe)
  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(nmake REQUIRED_VARS NMAKE_EXECUTABLE)
  mark_as_advanced(NMAKE_EXECUTABLE)

  set(CMAKE_MAKE_PROGRAM ${NMAKE_EXECUTABLE})
else()
  set(config_script ./configure)
  list(APPEND qt_with_args -c++std c++14)
endif()

set(qt_skip_modules
  -skip qtactiveqt -skip qtconnectivity -skip qtspeech -skip qtdoc
  -skip qtgamepad -skip qtlocation -skip qtpurchasing -skip qtdeclarative
  -skip qtquickcontrols -skip qtquickcontrols2 -skip qtscript -skip qtscxml
  -skip qtsensors -skip qtserialbus -skip qtserialport -skip qtvirtualkeyboard
  -skip qtwayland -skip qtwebchannel -skip qtwebview -skip qtxmlpatterns
  -skip qtwebengine -skip qtwebglplugin -skip qtwebsockets -skip qttranslations
  -skip qtremoteobjects -skip qttools -skip qtdatavis3d -skip qtcanvas3d
  -skip qtandroidextras -skip qtcharts -skip qtmultimedia -skip qtnetworkauth
  -skip qtgraphicaleffects)

ExternalProject_Add(qt5
  URL ${qt_url}
  URL_MD5 ${qt_md5}
  INSTALL_DIR ${ParamountSuperbuild_INSTALL_PREFIX}/qt5
  CONFIGURE_COMMAND ${config_script} --prefix=<INSTALL_DIR>
    ${qt_with_args} ${qt_skip_modules} -verbose
    BUILD_COMMAND ${CMAKE_MAKE_PROGRAM} VERBOSE=1
  INSTALL_COMMAND ${CMAKE_MAKE_PROGRAM} install
  BUILD_IN_SOURCE 1)

list(APPEND ParamountSuperbuild_THIRDPARTYLIBS_ARGS
  -DCMAKE_PREFIX_PATH:PATH=${ParamountSuperbuild_INSTALL_PREFIX}/qt5/lib/cmake/)
