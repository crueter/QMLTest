
cmake_minimum_required(VERSION 3.21.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

set(CMAKE_CXX_STANDARD 17)

project(SneedApp LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Import paths for Qt Creator's code model"
    FORCE
)

find_package(Qt6 6.2 REQUIRED COMPONENTS Core Gui Qml Quick)

set(CODE_ELEMENTS
    data/DataManager
    data/CacheManager

    #Settings
    #Recipe
)

#add_subdirectory(3rd_party)
#find_package(OFPLib)

foreach(ELEMENT ${CODE_ELEMENTS})
    set(HEADERS ${HEADERS} include/${ELEMENT}.h)
    set(SOURCES ${SOURCES} src/${ELEMENT}.cpp)
endforeach()

# set(PROJECT_SRC ${HEADERS} ${SOURCES})

qt_add_executable(${CMAKE_PROJECT_NAME} ${PROJECT_SRC})
qt_add_resources(${CMAKE_PROJECT_NAME} "configuration"
    PREFIX "/"
    FILES
    qtquickcontrols2.conf)

qt_add_qml_module(SneedApp
    URI SneedTest
    VERSION 1.0
    SOURCES
    Settings.h Settings.cpp
)

include(qds)

if (BUILD_QDS_COMPONENTS)
    include(qmlcomponents OPTIONAL)
endif()

if (LINK_INSIGHT)
    include(insight OPTIONAL)
endif ()

include(GNUInstallDirs)
install(TARGETS ${CMAKE_PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
