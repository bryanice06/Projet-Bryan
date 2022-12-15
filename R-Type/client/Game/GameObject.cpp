/*
** EPITECH PROJECT, 2020
** gameobject
** File description:
** cpp
*/

#include "GameObject.hpp"
#include <iostream>

GameObject::GameObject(int x, int y, Type type, int w, int h, Screen _screen, ButtonAction _action, ImgRect _imgRect)
{
    this->width = w;
    this->height = h;
    this->_hp = 1920;
    this->_hpPlayer = 3;
    this->_type = type;
    this->pos_x = x;
    this->pos_y = y;
    this->screen = _screen;
    this->rectLeft =_imgRect.rectLeft;
    this->rectTop = _imgRect.rectTop;
    this->_tmp_ennemi = 0;
    this->_dead = 0;
    this->_shoot = 0;
    if (type == Type::BUTTON || type == Type::BUTTONPLAY || type == Type::BUTTONCREDIT
    || type == Type::BUTTONMENU || type == Type::BUTTONRESTART) {
        this->isbutton = true;
        this->action = _action;
    }
    if (type == Type::PLAYER)
        this->isanimate = true;
}

GameObject::~GameObject() {}

ImgRect GameObject::getRect()
{
    ImgRect rect = {this->rectLeft, this->rectTop};
    return rect;
}

int GameObject::getRectLeft()
{
    return this->rectLeft;
}

int GameObject::getRectTop()
{
    return this->rectTop;
}

void GameObject::setRectLeft(int value)
{
    this->rectLeft = value;
}

void GameObject::setRectTop(int value)
{
    this->rectTop = value;
}

void GameObject::setRect(ImgRect _imgRect)
{
    this->rectLeft = _imgRect.rectLeft;
    this->rectTop = _imgRect.rectTop;
}

int GameObject::getPosition_x()
{
    return (this->pos_x);
}

int GameObject::getPosition_y()
{
    return (this->pos_y);
}

void GameObject::setPosition_x(int x)
{
    this->pos_x = x;
}

void GameObject::setPosition_y(int y)
{
    this->pos_y = y;
}

int GameObject::getSize_width()
{
    return (this->width);
}

int GameObject::getSize_height()
{
    return (this->height);
}

void GameObject::setSize_width(int w)
{
    this->width = w;
}

void GameObject::setSize_height(int h)
{
    this->height = h;
}

Type GameObject::getPosition_Type()
{
    return (this->_type);
}

int GameObject::getSprite()
{
    return (this->_type);
}

int GameObject::getTmpEnnemi()
{
    return (this->_tmp_ennemi);
}

void GameObject::setTmpEnnemi(int tmp)
{
    this->_tmp_ennemi = tmp;
}

void GameObject::setDead(int dead)
{
    this->_dead = dead;
}

int GameObject::getDead()
{
    return (this->_dead);
}

void GameObject::setHp(int hp)
{
    this->_hp = hp;
}

int GameObject::getHp()
{
    return (this->_hp);
}

void GameObject::setHpPlayer(int hp)
{
    this->_hpPlayer = hp;
}

int GameObject::getHpPlayer()
{
    return (this->_hpPlayer);
}

void GameObject::setShoot(int shoot)
{
    this->_shoot = shoot;
}

int GameObject::getShoot()
{
    return (this->_shoot);
}

