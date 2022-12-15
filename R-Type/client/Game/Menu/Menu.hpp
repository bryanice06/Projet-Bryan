/*
** EPITECH PROJECT, 2020
** menu
** File description:
** hpp
*/

#ifndef _MENU_HPP_
#define _MENU_HPP_

#include "../IScreenView.hpp"


class Menu: public IScreenView {
public:
    Menu(std::vector<std::string>);
    virtual void Init(std::vector<std::string>);
    virtual void Event(int);
    virtual std::vector<GameObject*> Draw();
private:
    std::vector<GameObject*> _MenuObject;
};

#endif