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
        QML_FILES Page1.qml
        QML_FILES Page2.qml
        QML_FILES Page3.qml
        QML_FILES data.js
        RESOURCES close.svg
        RESOURCES
        RESOURCES
        RESOURCES warning.svg
        RESOURCES error.svg
        RESOURCES not_work.svg
        RESOURCES work.svg
        RESOURCES restore.svg
        RESOURCES mini.svg
        RESOURCES
        RESOURCES
        RESOURCES
        RESOURCES imge.png
        RESOURCES play.svg
        RESOURCES statusHeight.svg
        RESOURCES statusMedium.svg
        RESOURCES statusLow.svg
        QML_FILES statusEnum.js
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
