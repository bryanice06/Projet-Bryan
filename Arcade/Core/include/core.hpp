/*
** EPITECH PROJECT, 2020
** core
** File description:
** hpp
*/

#ifndef _CORE_HPP_
#define _CORE_HPP_

#include <iostream>
#include <fstream>
#include <string>
#include <ostream>
#include <dlfcn.h>
#include <vector>
#include <dirent.h>
#include <grp.h>
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pwd.h>
#include "../../Graphicals/include/IGraphicalsModule.hpp"
#include "../../Games/include/IGameModule.hpp"

class Core {
    public:
        Core(const std::string &);
        ~Core();
        void Draw();
        void Init_lib_graphical(const std::string &);
        void Init_lib_game(const std::string &);
        void Init_tab_lib_graphical(const std::string &);
        void Init_tab_lib_game(const std::string &);
        void Event(int i);
        std::string get_prev_graph(std::string);
        std::string get_next_graph(std::string);
        std::string get_prev_game(std::string);
        std::string get_next_game(std::string);
    private:
        std::string _nameLib_graphical;
        std::string _loose_game;
        std::string _nameLib_game;
        void *handl_graph;
        void *symdl_graph;
        maker_graphicals pGraphical;
        IGraphicalsModule *IGraphicals;
        void *handl_game;
        void *symdl_game;
        maker_game pGame;
        IGameModule *IGame;
        std::string _event;
        int no_init_game;
        std::vector<std::string> tab_change_lib;
        std::vector<std::string> tab_change_game;
};

#endif