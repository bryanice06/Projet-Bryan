/*
** EPITECH PROJECT, 2020
** stage2
** File description:
** hpp
*/

#ifndef _STAGE2_HPP_
#define _STAGE2_HPP_

#include "../../GameObject.hpp"
#include <vector>
#include <cstdlib>
#include "../IStage.hpp"

class Stage2: public IStage {
    public:
        Stage2(std::vector<GameObject*>);
        ~Stage2();
        virtual void Init();
        virtual std::vector<GameObject*> getTab();
        virtual void Event(int, std::vector<GameObject*>);
        void Event_boss2(int);
        void Event_ennemie(int);
        void Event_ennemie2(int);
        int getEnnemi();
        void shoot_move(int);
        void shootboss_move(int);
        void rand_shoot(int);
        void rand_shootboss(int);
        void Event_dmg(int);
        int getPlayer();
    private:
        std::vector<GameObject*> _stage2;
        int _special_boss;
        int _tmp_shoot_boss;
        int _player;
        int bossIsReady = 0;
};

#endif