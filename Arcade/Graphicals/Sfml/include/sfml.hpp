/*
** EPITECH PROJECT, 2020
** core
** File description:
** hpp
*/

#ifndef _SFML_HPP_
#define _SFML_HPP_

#include <SFML/Window.hpp>
#include <SFML/Graphics.hpp>
#include "../../include/IGraphicalsModule.hpp"

class Sfml: public IGraphicalsModule {
    public:
        virtual void Init();
        virtual int Event(std::string *);
        virtual void Destroy();
        virtual void Draw(const std::vector<std::string>);
        bool WindowisOpen();
        void createText(std::string, int, int);
        void CreatePixel(std::string, int, int, int, int, sf::Color);
    private:
        sf::RenderWindow _window;
        sf::Event _event;
        sf::Texture _texture;
        sf::Font _font;
};

extern "C" IGraphicalsModule *Create()
{
        return new Sfml();
}

#endif