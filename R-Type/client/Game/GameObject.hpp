/*
** EPITECH PROJECT, 2020
** gameobject
** File description:
** hpp
*/

#ifndef _GAMEOBJECT_HPP_
#define _GAMEOBJECT_HPP_

#define WIDHT_BUTTON 320
#define HEIGHT_BUTTON 200
#define EREASE -10000

#include <iostream>

enum ButtonAction {
    NOTHING,
    GOTOGAME,
    GOTOMENU,
    GOTOSETTINGS,
};

enum Move {
    UP = 4,
    DOWN = 5,
    LEFT = 6,
    RIGHT = 7,
    SHOOT = 8,
    NONE = 10000
};
enum Type {
    PLAYER,
    VIEPLAYER,
    LASERSENNEMI,
    LASERSENNEMI3,
    LASERSBOSS,
    SPECIALBOSS,
    ENNEMIE,
    ENNEMIE2,
    ENNEMIE3,
    BACKGROUND,
    BUTTON,
    MENUTITLE,
    STAGETITLE1,
    STAGETITLE2,
    STAGETITLE3,
    WINTITLE,
    LOOSETITLE,
    SETTINGSTITLE,
    BOSS1,
    BOSS2,
    BOSS3,
    VIEBOSS,
    LASERS,
    BACKGROUNDGAME1,
    BACKGROUNDGAME2,
    BACKGROUNDGAME3,
    BACKGROUNDWIN,
    BACKGROUNDLOOSE,
    BACKGROUNDMENU,
    BACKGROUNDCREDIT,
    BUTTONMENU,
    BUTTONRESTART,
    BUTTONPLAY,
    BUTTONCREDIT,
};
struct ImgRect {
    int rectLeft;
    int rectTop;
};

enum Screen {
    SMENU,
    SGAME,
    SSETTINGS,
};

class GameObject {
    public:
        GameObject(int, int, Type, int, int, Screen, ButtonAction, ImgRect);
        ~GameObject();
        int getSprite();
        int getPosition_x();
        int getPosition_y();
        void setPosition_x(int);
        void setPosition_y(int);
        int getSize_width();
        int getSize_height();
        void setSize_width(int);
        void setSize_height(int);
        int getRectLeft();
        int getRectTop();
        void setRectLeft(int);
        void setRectTop(int);
        Type getPosition_Type();
        Screen screen;
        ButtonAction action;
        ImgRect getRect();
        void setRect(ImgRect);
        void setTmpEnnemi(int);
        int getTmpEnnemi();
        void setDead(int);
        int getDead();
        void setHp(int);
        int getHp();
        void setHpPlayer(int);
        int getHpPlayer();
        void setShoot(int);
        int getShoot();
    private:
        int pos_x;
        int pos_y;
        int width;
        int height;
        bool isbutton = false;
        bool isanimate = false;
        Type _type;
        ImgRect rect;
        int rectLeft;
        int rectTop;
        int _dead;
        int _tmp_ennemi;
        int _hp;
        int _hpPlayer;
        int _shoot;
};


#endif