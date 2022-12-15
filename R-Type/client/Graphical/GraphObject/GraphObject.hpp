//
// Created by tjeanningros on 30/10/2020.
//

#ifndef R_TYPE_GRAPHOBJECT_HPP
#define R_TYPE_GRAPHOBJECT_HPP

#include <SFML/Graphics.hpp>
#include <SFML/Window.hpp>
#include "../IGraphical.hpp"
#include "../../Game/GameObject.hpp"

#include "Asset.hpp"

class GraphObject {
    public:
        GraphObject(int, int, Type, int, int, Screen, ButtonAction, ImgRect, sf::Texture *);
        ~GraphObject();
        int getPosition_x();
        int getPosition_y();
        void setPosition_x(int);
        void setPosition_y(int);
        sf::Sprite getSprite();
        int getSize_width();
        int getSize_height();
        void setSize_width(int);
        void setSize_height(int);
        int getRectLeft();
        int getRectTop();
        void setRectLeft(int);
        void setRectTop(int);
        Type getPosition_Type();
        sf::Sprite _sprite;
        Screen screen;
        bool verifIsButton();
        ButtonAction action = NOTHING;
        ImgRect getRect();
        void setHp(int);
        int getHp();
        void setRect(ImgRect);
    private:
        sf::Texture _texture;
        int pos_x;
        int pos_y;
        int width;
        int height;
        Type _type;
        Asset asset;
        bool isButton = false;
        ImgRect rect;
        int rectLeft;
        int rectTop;
        int _hp;

};
#endif //R_TYPE_GRAPHOBJECT_HPP
