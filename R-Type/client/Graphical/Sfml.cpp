/*
** EPITECH PROJECT, 2020
** sfml
** File description:
** cpp
*/

#include "Sfml.hpp"
#include <iostream>

Sfml::Sfml() {
 this->_window.create(sf::VideoMode(1920, 1080), "R-Type");
 Init();
}

void Sfml::Init()
{
    for (int i = 0; i < this->asset.TypePath.size(); i++) {
        sf::Texture text;
        text.create(50, 50);
        text.loadFromFile(this->asset.TypePath[i]);
        this->textures.push_back(text);
    }
    this->bufferSound.loadFromFile("client/Game/sound/laser-sound-effect.wav");
    this->sound.setBuffer(this->bufferSound);
    this->sound.setPlayingOffset(sf::seconds(2.f));

    this->music.openFromFile("client/Game/sound/soundGame.ogg");
    this->music.play();
    this->music.setLoop(true);
    this->_font.loadFromFile("client/Graphical/font/sf_slapstick_comic_shaded.ttf");
}

void Sfml::CreateGraphObject(std::vector<GameObject*> draw)
{
    if (this->Image.size() != 0) {
        if (draw.size() < this->Image.size() || draw[5]->getPosition_Type() != this->Image[5]->getPosition_Type())
            this->Image.clear();
    }
    if (this->Image.size() > draw.size()) {
        for (int i = 0; i < this->Image.size(); ++i)
            delete &this->Image[i]->_sprite;
        this->Image.clear();
    }
    for (int i = this->Image.size(); i < draw.size(); i++) {
        if (draw[i]->getPosition_Type() == LASERS) {
            this->sound.play();
        }
        this->Image.push_back(
            new GraphObject(
            draw[i]->getPosition_x(),
            draw[i]->getPosition_y(),
            draw[i]->getPosition_Type(),
            draw[i]->getSize_width(),
            draw[i]->getSize_height(),
            draw[i]->screen,
            draw[i]->action,
            draw[i]->getRect(),
            &this->textures[draw[i]->getPosition_Type()]
            )
        );
    }
}

void Sfml::Draw(std::vector<GameObject*> draw, Screen screen)
{
    sf::sleep(sf::milliseconds(10));
    if (this->Image.size() != draw.size()) {

        this->CreateGraphObject(draw);
    }
    for (int i = 0; i < this->Image.size(); i++) {
        if (this->Image[i]->screen == screen) {
            this->Image[i]->setPosition_x(draw[i]->getPosition_x());
            this->Image[i]->setPosition_y(draw[i]->getPosition_y());
            this->Image[i]->setRectLeft(draw[i]->getRectLeft());
            this->Image[i]->setRectTop(draw[i]->getRectTop());
            this->Image[i]->setSize_width(draw[i]->getSize_width());
            this->Image[i]->_sprite.setPosition(this->Image[i]->getPosition_x(), this->Image[i]->getPosition_y());
            this->Image[i]->_sprite.setTextureRect(
                    {
                        this->Image[i]->getRectLeft(),
                            this->Image[i]->getRectTop(),
                            this->Image[i]->getSize_width(),
                            this->Image[i]->getSize_height()
                    }
            );
            this->_window.draw(this->Image[i]->_sprite);
        }
    }

    this->_window.display();

}

int Sfml::Event()
{
    this->_window.clear();
    sf::sleep(sf::milliseconds(10));
    while (this->_window.pollEvent(this->_event)) {
        if (this->_event.type == sf::Event::KeyPressed) {
            if(this->_event.key.code == sf::Keyboard::Q) {
                this->_window.close();
                return 666;
            }
            if (this->_event.key.code == sf::Keyboard::A) {
                this->Image.clear();
                return 1;
            }
            if (this->_event.key.code == sf::Keyboard::Z) {
                this->Image.clear();
                return 2;
            }
            if (this->_event.key.code == sf::Keyboard::Up) {
                return (int)UP;
            }
            if (this->_event.key.code == sf::Keyboard::Down) {
                return (int)DOWN;
            }
            if (this->_event.key.code == sf::Keyboard::Left) {
                return (int)LEFT;
            }

            if (this->_event.key.code == sf::Keyboard::Right) {
                return (int)RIGHT;
            }
            if (this->_event.key.code == sf::Keyboard::W) {
                return (int)SHOOT;
            }


        } else if (sf::Mouse::isButtonPressed(sf::Mouse::Left)){
            sf::Vector2i position = sf::Mouse::getPosition();
             for (int i = 0; i < this->Image.size(); i++) {
                if (this->Image[i]->verifIsButton() == true
                && position.x >= this->Image[i]->getPosition_x()
                && position.x <= (this->Image[i]->getPosition_x() + this->Image[i]->getSize_width())
                && position.y >= this->Image[i]->getPosition_y()
                && position.y <= (this->Image[i]->getPosition_y() + this->Image[i]->getSize_height())) {
                    this->Image.clear();
                    return (int)this->Image[i]->action;
                }
            }
        }
        return 0;
    }
    return 200000;
}

void Sfml::CreatePixel(std::string c, int width, int height, int x, int y, sf::Color color)
{
    sf::Sprite sprite;
    sf::Texture texture;

    texture.create(20, 20);
    texture.loadFromFile(c);
    sprite.setTexture(texture);
    sprite.setPosition(x, y);
    sprite.setTextureRect({0, 0, width, height});
    this->_window.draw(sprite);
}

void Sfml::CreateText(char c, int x, int y)
{
    sf::Text text;
    sf::Color color = sf::Color(0, 0, 0);

    text.setFont(this->_font);
    text.setString(c);
    text.setCharacterSize(20);
    text.setPosition(x, y);
    this->_window.draw(text);
}

bool Sfml::WindowisOpen() {
    if (this->_window.isOpen())
        return true;
    return false;
}

void Sfml::Destroy()
{
    this->_window.close();
}
