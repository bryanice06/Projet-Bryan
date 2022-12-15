/*
** EPITECH PROJECT, 2020
** client
** File description:
** hpp
*/

#ifndef _CLIENT_HPP_
#define _CLIENT_HPP_

#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <ostream>
#include <dlfcn.h>
#include <dirent.h>
#include <grp.h>
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <vector>
#include <iostream>
//#include "Game/Menu/Menu.hpp"
//#include "Graphical/Sfml.hpp"
#include "Graphical/IGraphical.hpp"
#include "Graphical/GraphFactory.hpp"
//#include "Game/Game.hpp"
#include "Game/IScreenView.hpp"
#include "Game/ScreenViewFactory.hpp"
//#include "Game/Loose/Loose.hpp"

class Client {
    public:
        Client();
        ~Client();
        void Init();
        void Event();
        void Draw();

    private:
        IGraphical *Igraphical;
        IScreenView *IscreenView;
        int _event;
        int _init_game;
};

#endif