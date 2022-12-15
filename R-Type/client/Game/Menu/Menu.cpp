/*
** EPITECH PROJECT, 2020
** menu
** File description:
** cpp
*/

#include "Menu.hpp"

Menu::Menu(std::vector<std::string> tab)
{
    Init(tab);
}

void Menu::Init(std::vector<std::string> player)
{
    this->_MenuObject.push_back(new GameObject(0, 0, BACKGROUNDMENU, 1920, 1080, SMENU, ButtonAction::NOTHING, {0,0}));
    this->_MenuObject.push_back(new GameObject(800, 170, MENUTITLE, 325, 75, SMENU, ButtonAction::NOTHING, {0,0}));
    this->_MenuObject.push_back(new GameObject(820, 480, BUTTONPLAY, 400, 131, SMENU, ButtonAction::GOTOGAME, {0,0}));
    this->_MenuObject.push_back(new GameObject(910, 645, BUTTONCREDIT, 400, 131, SMENU, ButtonAction::GOTOSETTINGS, {0,0}));
}

void Menu::Event(int event) {}

std::vector<GameObject*> Menu::Draw()
{
    return (this->_MenuObject);
}