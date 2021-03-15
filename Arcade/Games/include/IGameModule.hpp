/*
** EPITECH PROJECT, 2020
** Graphicals
** File description:
** hpp
*/

#ifndef _IGAMEMODULE_HPP_
#define _IGAMEMODULE_HPP_

#include <iostream>
#include <fstream>
#include <string>
#include <ostream>
#include <dlfcn.h>
#include <unistd.h>
#include <vector>

class IGameModule {
    public:
        virtual void Init() = 0;
        virtual std::vector<std::string> Draw() = 0;
        virtual void Destroy() = 0;
        virtual int Event(std::string *) = 0;
};

typedef IGameModule *(*maker_game)();

#endif