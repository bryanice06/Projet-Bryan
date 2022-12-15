/*
** EPITECH PROJECT, 2020
** stage3
** File description:
** hpp
*/

#ifndef _STAGE3_HPP_
#define _STAGE3_HPP_

#include "../../GameObject.hpp"
#include <vector>
#include <cstdlib>
#include "../IStage.hpp"

class Stage3: public IStage {
    public:
        Stage3(std::vector<GameObject*>);
        ~Stage3();
        virtual void Init();
        virtual std::vector<GameObject*> getTab();
        virtual void Event(int, std::vector<GameObject*>);
        void Event_boss3(int);
        void Event_ennemie(int);
        void Event_ennemie2(int);
        void Event_ennemie3(int);
        int getEnnemi();
        void shoot_move(int);
        void shootboss_move(int);
        void rand_shoot(int);
        void rand_shootboss(int);
        void Event_dmg(int);
        int getPlayer();
    private:
        std::vector<GameObject*> _stage3;
        int _special_boss;
        int _tmp_shoot_boss;
        int _player;
};

#endif