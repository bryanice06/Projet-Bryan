project(R-Type)
cmake_minimum_required(VERSION 2.8.12)
add_definitions("-fpic -shared -lsfml-graphics -lsfml-window -lsfml-system -g3 -lboost_system -lboost_date_time -lboost_thread")


set(CMAKE_CXX_STANDARD 11)
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

include_directories(${CMAKE_INCLUDE_PATH})

set(SOURCES_CLIENTS
        client/Game/GamePannel/Player/Player.cpp
        client/Game/Game.cpp
        client/Game/Menu/Menu.cpp
        client/Game/Settings/Settings.cpp
        client/Game/GameObject.cpp
        client/Game/GamePannel/Stage1/Stage1.cpp
        client/Game/GamePannel/Stage2/Stage2.cpp
        client/Game/GamePannel/Stage3/Stage3.cpp
        client/Game/GamePannel/Win/Win.cpp
        client/Game/GamePannel/Loose/Loose.cpp
        client/Graphical/GraphObject/GraphObject.cpp
        client/Graphical/Sfml.cpp
        client/Client.cpp
        client/main.cpp)
set(INCLUDES_CLIENTS
        client/Game/GamePannel/Player/Player.hpp
        client/Game/Game.hpp
        client/Game/Menu/Menu.hpp
        client/Game/Settings/Settings.hpp
        client/Game/GameObject.hpp
        client/Game/GamePannel/Stage1/Stage1.hpp
        client/Game/GamePannel/Stage2/Stage2.hpp
        client/Game/GamePannel/Stage3/Stage3.hpp
        client/Game/GamePannel/Win/Win.hpp
        client/Game/GamePannel/Loose/Loose.hpp
        client/Game/GamePannel/IStage.hpp
        client/Game/GamePannel/StageFactory.hpp
        client/Game/ScreenViewFactory.hpp
        client/Game/IScreenView.hpp
        client/Graphical/IGraphical.hpp
        client/Graphical/GraphFactory.hpp
        client/Graphical/GraphObject/GraphObject.hpp
        client/Graphical/Sfml.hpp
        client/Client.hpp)

add_executable(r-type_server server/main.cpp)
add_executable(r-type_client ${SOURCES_CLIENTS} ${INCLUDES_CLIENTS})

target_link_libraries(r-type_server ${CONAN_LIBS})
target_link_libraries(r-type_client ${CONAN_LIBS})
