/*
** EPITECH PROJECT, 2020
** sfml
** File description:
** hpp
*/

#ifndef _SFML_HPP_
#define _SFML_HPP_

#include "GraphObject/GraphObject.hpp"
#include <SFML/Audio.hpp>

class Sfml: public IGraphical {
    public:
        Sfml();
        virtual void Init();
        virtual int Event();
        virtual void Destroy();
        virtual void Draw(std::vector<GameObject*>, Screen);
        bool WindowisOpen();
        void CreateText(char, int, int);
        void CreatePixel(std::string, int, int, int, int, sf::Color);
        void CreateGraphObject(std::vector<GameObject*>);
        sf::Texture Init_texture(const std::string&);
        sf::Sprite Init_sprite(sf::Texture);
    private:
        std::vector<sf::Texture> textures;
        Asset asset;
        sf::RenderWindow _window;
        sf::SoundBuffer bufferSound;
        sf::Event _event;
        sf::Sound sound;
        sf::Font _font;
        sf::Music music;
        std::vector<GraphObject *> Image;
        std::vector<GraphObject *> Delete;
        // GameEngine *_engine;
        // GameObject *player;
};

#endif