/*
** EPITECH PROJECT, 2020
** sfml
** File description:
** hpp
*/

#ifndef _IGRAPHICAL_HPP_
#define _IGRAPHICAL_HPP_

#include <SFML/Graphics.hpp>
#include <SFML/Window.hpp>
#include <iostream>
#include <fstream>
#include <string>
#include <ostream>
#include <dlfcn.h>
#include <unistd.h>
#include <vector>

#include "../Game/GameObject.hpp"

class IGraphical {
    public:
        virtual void Init() = 0;
        virtual void Draw(std::vector<GameObject*>, Screen) = 0;
        virtual void Destroy() = 0;
        virtual int Event() = 0;
        virtual bool WindowisOpen() = 0;
};


#endif