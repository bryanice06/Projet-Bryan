/*
** EPITECH PROJECT, 2020
** core
** File description:
** hpp
*/

#ifndef _NCURSE_HPP_
#define _NCURSE_HPP_

#include "sys/sysinfo.h"
#include "sys/utsname.h"
#include "sys/user.h"
#include <limits.h>
#include "sys/file.h"
#include <ncurses.h>
#include "../../include/IGraphicalsModule.hpp"

class Ncurse: public IGraphicalsModule {
    public:
        virtual void Init();
        virtual int Event(std::string *);
        virtual void Destroy();
        virtual void Draw(const std::vector<std::string>);
        bool WindowisOpen();
//        int get_pos_mouse();
//        bool get_pos_text(int);
    private:
        useconds_t _usec;
        int _score;
        int _color;
        WINDOW * _win;
//        int _x_mouse;
//        int _y_mouse;
//        int _bouton_mouse;
};

extern "C" IGraphicalsModule *Create()
{
        return new Ncurse();
}

#endif