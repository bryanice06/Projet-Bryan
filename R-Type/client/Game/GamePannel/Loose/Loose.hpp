/*
** EPITECH PROJECT, 2020
** Loose
** File description:
** hpp
*/

#ifndef _LOOSE_HPP_
#define _LOOSE_HPP_

#include "../../GameObject.hpp"
#include <vector>
#include <cstdlib>
#include "../IStage.hpp"

class Loose: public IStage {
    public:
        Loose(std::vector<GameObject*>);
        ~Loose();
        virtual void Init();
        virtual std::vector<GameObject*> getTab();
        virtual void Event(int, std::vector<GameObject*>);
    private:
        std::vector<GameObject*> _loose;
};

#endif