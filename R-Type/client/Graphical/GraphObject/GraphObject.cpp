//
// Created by tjeanningros on 30/10/2020.
//

#include "GraphObject.hpp"


GraphObject::GraphObject(int x, int y, Type type, int w, int h, Screen _screen, ButtonAction _action, ImgRect _imgRect, sf::Texture *text)
{
    sf::Sprite sprite;
    this->_sprite = sprite;
    this->_hp = 1920;
    this->width = w;
    this->height = h;
    this->_sprite.setTexture(*text);
    this->screen = _screen;
    this->_type = type;
    this->pos_x = x;
    this->pos_y = y;
    this->rectLeft = _imgRect.rectLeft;
    this->rectTop = _imgRect.rectTop;
    if (type == Type::BUTTON || type == Type::BUTTONMENU || type == Type::BUTTONRESTART
    || type == Type::BUTTONCREDIT || type == Type::BUTTONPLAY) {
        this->isButton = true;
        this->action = _action;
    }
}

GraphObject::~GraphObject() {}

ImgRect GraphObject::getRect()
{
    return this->rect;
}

void GraphObject::setRect(ImgRect _imgRect)
{
    this->rect.rectLeft = _imgRect.rectLeft;
    this->rect.rectTop = _imgRect.rectTop;
}
int GraphObject::getRectLeft()
{
    return this->rectLeft;
}

int GraphObject::getRectTop()
{
    return this->rectTop;
}
void GraphObject::setRectLeft(int value)
{
    this->rectLeft = value;
}

void GraphObject::setRectTop(int value)
{
    this->rectTop = value;
}

int GraphObject::getPosition_x()
{
    return (this->pos_x);
}

int GraphObject::getPosition_y()
{
    return (this->pos_y);
}
void GraphObject::setPosition_x(int x)
{
    this->pos_x = x;
}

void GraphObject::setPosition_y(int y)
{
    this->pos_y = y;
}

int GraphObject::getSize_width()
{
    return (this->width);
}

int GraphObject::getSize_height()
{
    return (this->height);
}

bool GraphObject::verifIsButton()
{
    return (this->isButton);
}

void GraphObject::setHp(int hp)
{
    this->_hp = hp;
}

int GraphObject::getHp()
{
    return (this->_hp);
}

void GraphObject::setSize_width(int w)
{
    this->width = w;
}

void GraphObject::setSize_height(int h)
{
    this->height = h;
}

Type GraphObject::getPosition_Type()
{
    return (this->_type);
}