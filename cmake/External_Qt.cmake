set(qt_with_args
  -opensource -confirm-license -release -static -optimized-qmake
  -no-compile-examples -qt-zlib -qt-libpng -qt-libjpeg -qt-freetype
  -qt-pcre -qt-xcb -qt-xkbcommon -no-directfb -no-linuxfb)

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

set(qt_skip_features
  -no-feature-accessibility -no-feature-graphicseffect -no-feature-lcdnumber
  -no-feature-regularexpression -no-feature-syntaxhighlighter
  -no-feature-textedit -no-feature-validator)

ExternalProject_Add(qt5
  URL ${qt_url}
  URL_MD5 ${qt_md5}
  CONFIGURE_COMMAND ./configure --prefix=<INSTALL_DIR>
    ${qt_with_args} ${qt_skip_modules} ${qt_skip_features}
  BUILD_IN_SOURCE 1)

