#---------------------------------------------------------------------------------------
# @功能：       使用ffmpeg音视频库【软解码】实现的视频播放器，并将裸流保存到视频文件中（无需编码）
# @编译器：     Desktop Qt 5.12.5 MSVC2017 64bit 32bit（也支持其它编译器）
# @Qt IDE：    D:/Qt/Qt5.12.5/Tools/QtCreator/share/qtcreator
#
# @开发者     mhf
# @邮箱       1603291350@qq.com
# @时间       2022-09-14 14:13:52
# @备注       1、使用ffmpeg音视频库【软解码】实现的视频播放器；
#             2、支持打开本地视频文件（如mp4、mov、avi等）、网络视频流（rtsp、rtmp、http等）；
#             3、支持视频匀速播放；
#             4、采用QPainter进行显示，支持自适应窗口缩放；
#             5、视频播放支持实时开始/关闭、暂停/继续播放；
#             6、视频解码、线程控制、显示各部分功能分离，低耦合度。
#             7、采用最新的5.1.2版本ffmpeg库进行开发，超详细注释信息，将所有踩过的坑、解决办法、注意事项都得很写清楚。
#             8、在使用ffmpeg打开网络视频流时，如果是【h264裸流可以直接保存为本地文件】，不需要进行编码操作。
#---------------------------------------------------------------------------------------
QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
CONFIG += c++11
DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    ../../PaintingDemo/PlayImage/playimage.cpp \
    main.cpp \
    widget.cpp

HEADERS += \
    ../../PaintingDemo/PlayImage/playimage.h \
    widget.h

FORMS += \
    widget.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

# ffmpeg读取视频图像模块
include(./VideoPlay/VideoPlay.pri)
INCLUDEPATH += ./VideoPlay

# 自定义图片显示模块(QPainter)
INCLUDEPATH += ../../PaintingDemo/PlayImage/       # 包括头文件路径

#  定义程序版本号
VERSION = 1.0.0
DEFINES += APP_VERSION=\\\"$$VERSION\\\"
TARGET  = VideoPlaySave

contains(QT_ARCH, i386){        # 使用32位编译器
DESTDIR = $$PWD/../bin          # 程序输出路径
}else{
DESTDIR = $$PWD/../bin64        # 使用64位编译器
}
# msvc  编译器使用utf-8编码
msvc {
QMAKE_CFLAGS += /utf-8
QMAKE_CXXFLAGS += /utf-8
}
