/*
** EPITECH PROJECT, 2020
** stage1
** File description:
** hpp
*/

#ifndef _STAGE1_HPP_
#define _STAGE1_HPP_

#include "../../GameObject.hpp"
#include <vector>
#include <cstdlib>
#include "../IStage.hpp"

class Stage1: public IStage {
    public:
        Stage1(std::vector<GameObject*>);
        ~Stage1();
        virtual void Init();
        virtual std::vector<GameObject*> getTab();
        virtual void Event(int, std::vector<GameObject*>);
        void Event_boss1(int);
        void Event_ennemie(int);
        void Event_dmg(int);
        void Event_dmgBoss(int);
        int getPlayer();
        int getEnnemi();
    private:
        std::vector<GameObject*> _stage1;
        int _player;
        int _tmp_dmgboss;
};

#endif