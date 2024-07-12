cmake_minimum_required(VERSION 3.16)

project(project VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appproject
    main.cpp
)

qt_add_qml_module(appproject
    URI project
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES HomePage.qml
        QML_FILES MicrophoneDetailsPage.qml
        QML_FILES HistoryFailurePage.qml
        QML_FILES
        RESOURCES src/img/imge.png
        RESOURCES src/icon/work.svg

        RESOURCES src/icon/close.svg
        RESOURCES
        RESOURCES
        RESOURCES src/icon/warning.svg
        RESOURCES src/icon/error.svg
        RESOURCES src/icon/not_work.svg
        RESOURCES src/icon/restore.svg
        RESOURCES src/icon/mini.svg
        RESOURCES
        RESOURCES
        RESOURCES

        RESOURCES src/icon/play.svg
        RESOURCES src/icon/statusHeight.svg
        RESOURCES src/icon/statusMedium.svg
        RESOURCES src/icon/statusLow.svg
        QML_FILES statusEnum.js
        RESOURCES server.py
        RESOURCES data.json
        QML_FILES constants.js
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appproject PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appproject
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appproject
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appproject
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
