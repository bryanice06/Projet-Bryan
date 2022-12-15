/*
** EPITECH PROJECT, 2020
** win
** File description:
** hpp
*/

#ifndef _WIN_HPP_
#define _WIN_HPP_

#include "../../GameObject.hpp"
#include <vector>
#include <cstdlib>
#include "../IStage.hpp"

class Win: public IStage {
    public:
        Win(std::vector<GameObject*>);
        ~Win();
        virtual void Init();
        virtual std::vector<GameObject*> getTab();
        virtual void Event(int, std::vector<GameObject*>);
    private:
        std::vector<GameObject*> _win;
};

#endif