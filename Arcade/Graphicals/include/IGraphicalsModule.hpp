/*
** EPITECH PROJECT, 2020
** Graphicals
** File description:
** hpp
*/

#ifndef _IGRAPHICALSMODULE_HPP_
#define _IGRAPHICALSMODULE_HPP_

#include <iostream>
#include <fstream>
#include <string>
#include <ostream>
#include <dlfcn.h>
#include <unistd.h>
#include <vector>

class IGraphicalsModule {
    public:
        virtual void Init() = 0;
        virtual void Draw(const std::vector<std::string>) = 0;
        virtual void Destroy() = 0;
        virtual int Event(std::string *) = 0;
        virtual bool WindowisOpen() = 0;
};

typedef IGraphicalsModule *(*maker_graphicals)();

#endif