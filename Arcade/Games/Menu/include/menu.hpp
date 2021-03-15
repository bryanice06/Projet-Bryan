/*
** EPITECH PROJECT, 2020
** core
** File description:
** hpp
*/

#ifndef _MENU_HPP_
#define _MENU_HPP_

#include "../../include/IGameModule.hpp"

class Menu : public IGameModule {
    public:
        virtual void Init();
        virtual std::vector<std::string> Draw();
        virtual void Destroy();
        virtual int Event(std::string *);
        std::vector<std::string> open_file(const char *);
    private:
        std::vector<std::string> _menu;
};

extern "C" IGameModule *Create()
{
    return new Menu();
}

#endif