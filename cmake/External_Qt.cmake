set(qt_with_args
  -opensource -confirm-license -release -static -optimized-qmake
  -no-compile-examples -qt-zlib -qt-libpng -qt-libjpeg -qt-freetype
  -qt-pcre -qt-xcb -qt-xkbcommon -no-directfb -no-linuxfb -no-openssl
  -no-cups -no-iconv -no-evdev -no-icu -no-dbus -no-qml-debug
  -no-sql-sqlite -nomake examples -nomake tests)

set(qt_skip_modules
  -skip qtactiveqt -skip qtandroidextras -skip qtcanvas3d -skip qtcharts
  -skip qtconnectivity -skip qtdatavis3d -skip qtdeclarative -skip qtdoc
  -skip qtgamepad -skip qtgraphicaleffects -skip qtimageformats
  -skip qtlocation -skip qtmacextras -skip qtmultimedia -skip qtnetworkauth
  -skip qtpurchasing -skip qtquickcontrols -skip qtquickcontrols2
  -skip qtremoteobjects -skip qtscript -skip qtscxml -skip qtsensors
  -skip qtserialbus -skip qtserialport -skip qtspeech -skip qtsvg -skip qttools
  -skip qttranslations -skip qtvirtualkeyboard -skip qtwayland
  -skip qtwebchannel -skip qtwebengine -skip qtwebglplugin -skip qtwebsockets
  -skip qtwebview -skip qtwinextras -skip qtx11extras -skip qtxmlpatterns)

ExternalProject_Add(qt5
  URL ${qt_url}
  URL_MD5 ${qt_md5}
  INSTALL_DIR ${ParamountSuperbuild_INSTALL_PREFIX}/qt5
  CONFIGURE_COMMAND ./configure --prefix=<INSTALL_DIR>
    ${qt_with_args} ${qt_skip_modules}
  BUILD_IN_SOURCE 1)

list(APPEND ParamountSuperbuild_THIRDPARTYLIBS_ARGS
  -DCMAKE_PREFIX_PATH:PATH=${ParamountSuperbuild_INSTALL_PREFIX}/qt5/lib/cmake/)
