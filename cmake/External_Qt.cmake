# Prepend |prefix| for each list element
function(prepend var prefix)
  set(listvar "")
  foreach(f ${ARGN})
    list(APPEND listvar "${prefix}${f}")
  endforeach()
  set(${var} ${listvar} PARENT_SCOPE)
endfunction()

set(qt_with_args
  -opensource -confirm-license -release -static -optimized-qmake
  -no-compile-examples -qt-zlib -qt-libpng -qt-libjpeg -qt-freetype
  -qt-pcre -qt-xcb -qt-xkbcommon -no-directfb -no-linuxfb)

set(qt_skip_modules
  qtactiveqt qtandroidextras qtcanvas3d qtcharts qtconnectivity qtdatavis3d
  qtdeclarative qtdoc qtgamepad qtgraphicaleffects qtimageformats qtlocation
  qtmacextras qtmultimedia qtnetworkauth qtpurchasing qtquickcontrols
  qtquickcontrols2 qtremoteobjects qtscript qtscxml qtsensors qtserialbus
  qtserialport qtspeech qtsvg qttools qttranslations qtvirtualkeyboard
  qtwayland qtwebchannel qtwebengine qtwebglplugin qtwebsockets qtwebview
  qtwinextras qtx11extras qtxmlpatterns)
prepend(qt_skip_modules "-skip " ${qt_skip_modules})

set(qt_skip_features
  accessibility graphicseffect graphicsview lcdnumber regularexpression
  syntaxhighlighter textedit validator)
prepend(qt_skip_features "-no-feature-" ${qt_skip_features})

ExternalProject_Add(qt5
  URL ${qt_url}
  URL_MD5 ${qt_md5}
  CONFIGURE_COMMAND ./configure --prefix=<INSTALL_DIR>
    ${qt_with_args} ${qt_skip_modules} ${qt_skip_features}
  BUILD_IN_SOURCE 1)

