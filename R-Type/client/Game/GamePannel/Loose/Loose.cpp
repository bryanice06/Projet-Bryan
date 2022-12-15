/*
** EPITECH PROJECT, 2020
** sin
** File description:
** cpp
*/

#include "Loose.hpp"

Loose::Loose(std::vector<GameObject*> _gameObject)
{
    Init();
}

Loose::~Loose() {}

void Loose::Init()
{
    this->_loose.push_back(new GameObject(0, 0, BACKGROUNDLOOSE, 1920, 1080, SGAME, ButtonAction::NOTHING, {0,0}));
    this->_loose.push_back(new GameObject(695, 125, LOOSETITLE, 570, 77, SGAME, ButtonAction::NOTHING, {0,0}));
    this->_loose.push_back(new GameObject(1085 , 490, BUTTONRESTART, 400, 131, SGAME, ButtonAction::GOTOGAME, {0,0}));
    this->_loose.push_back(new GameObject(1160 , 650, BUTTONMENU, 400, 131, SGAME, ButtonAction::GOTOMENU, {0,0}));
}

void Loose::Event(int i, std::vector<GameObject*> gameObject) {}

std::vector<GameObject*> Loose::getTab()
{
    return (this->_loose);
}