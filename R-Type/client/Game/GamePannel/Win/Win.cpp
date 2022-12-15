/*
** EPITECH PROJECT, 2020
** sin
** File description:
** cpp
*/

#include "Win.hpp"

Win::Win(std::vector<GameObject*> _gameObject)
{
    Init();
}

Win::~Win() {}

void Win::Init()
{
    this->_win.push_back(new GameObject(0, 0, BACKGROUNDWIN, 1920, 1080, SGAME, ButtonAction::NOTHING, {0,0}));
    this->_win.push_back(new GameObject(700, 190, WINTITLE, 433, 75, SGAME, ButtonAction::NOTHING, {0,0}));
    this->_win.push_back(new GameObject(770, 480, BUTTONMENU, 400, 131, SGAME, ButtonAction::GOTOMENU, {0,0}));
}

void Win::Event(int i, std::vector<GameObject*> gameObject) {}

std::vector<GameObject*> Win::getTab()
{
    return (this->_win);
}