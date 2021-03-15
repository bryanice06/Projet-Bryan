/*
** EPITECH PROJECT, 2020
** Sfml
** File description:
** cpp
*/

#include "../include/sfml.hpp"

void Sfml::Init()
{
    this->_window.create(sf::VideoMode(1920, 1080), "Game");
    this->_texture.create(20, 20);
    this->_font.loadFromFile("Graphicals/sf_slapstick_comic_shaded.ttf");
}

void Sfml::Draw(const std::vector<std::string> draw)
{
    int z = 0;
    int sizey = 0;
    int posy = 0;
    int color_ghost = 0;
    std::vector<std::string> ghost1;
    ghost1.push_back("Graphicals/assets/ghost1.png");
    ghost1.push_back("Graphicals/assets/ghostCanDie.png");
    std::vector<std::string> ghost2;
    ghost2.push_back("Graphicals/assets/ghost2.png");
    ghost2.push_back("Graphicals/assets/ghostCanDie.png");
    std::vector<std::string> ghost3;
    ghost3.push_back("Graphicals/assets/ghost3.png");
    ghost3.push_back("Graphicals/assets/ghostCanDie.png");
    std::vector<std::string> ghost4;
    ghost4.push_back("Graphicals/assets/ghost4.png");
    ghost4.push_back("Graphicals/assets/ghostCanDie.png");

    if (this->_window.isOpen()) {
        if (draw.back() == "FOOD")
            color_ghost = 1;
        for (int i = 0; i < draw.size(); i++) {
            for (int y = 0; y < draw[i].size(); y++) {
                std::string s(1, draw[i][y]);   
                if (draw[i][y] == 'q' || draw[i][y] == '!')
                    this->CreatePixel("Graphicals/assets/snakeCore.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 0, 0));                
                else if (draw[i][y] == ']')
                    this->CreatePixel("Graphicals/assets/cerise.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(0, 255, 0));
                else if (draw[i][y] == '/')
                    this->CreatePixel("Graphicals/assets/snakeHead.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(0, 255, 0));
                else if (draw[i][y] == '*')
                    this->CreatePixel("Graphicals/assets/block.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(0, 0, 255));  
                else if (draw[i][y] == 'W')
                    this->CreatePixel("Graphicals/assets/blockred.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(0, 0, 255));                        
                else if (draw[i][y] == ' ')
                    this->CreatePixel("Graphicals/assets/blackRect.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 255, 255));
                else if (draw[i][y] == '_' && draw.size() > 16)
                    this->CreatePixel("Graphicals/assets/cianRect.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 255, 255));
                else if (draw[i][y] == '>' && draw.size() > 16)
                    this->CreatePixel("Graphicals/assets/pacman.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 255, 255));
                else if (draw[i][y] == '+' && draw.size() > 16)
                    this->CreatePixel(ghost1[color_ghost], 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 255, 255));
                else if (draw[i][y] == '-' && draw.size() > 16)
                    this->CreatePixel(ghost2[color_ghost], 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 255, 255));
                else if (draw[i][y] == ';' && draw.size() > 16)
                    this->CreatePixel(ghost3[color_ghost], 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 255, 255));
                else if (draw[i][y] == '?' && draw.size() > 16)
                    this->CreatePixel(ghost4[color_ghost], 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 255, 255));
                else if (draw[i][y] == '.' && draw.size() > 16)
                    this->CreatePixel("Graphicals/assets/point.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 255, 255));
                else if (draw[i][y] == '%' && draw.size() > 16)
                    this->CreatePixel("Graphicals/assets/food.png", 20, 20, y * 20 + 710, z * 20 , sf::Color(255, 255, 255));
                else if (draw[i][y] != ',')
                    this->createText(s, y * 20 + 710, z * 20 );
            }
            z++;
        }
        this->_window.display();
    }
}

void Sfml::CreatePixel(std::string c, int width, int height, int x, int y, sf::Color color) {

    sf::Sprite sprite;
    sf::Texture texture;

    texture.create(20, 20);
    texture.loadFromFile(c);
    sprite.setTexture(texture);
    sprite.setPosition(x, y);
    sprite.setTextureRect({0, 0, width, height});
    this->_window.draw(sprite);

}

void Sfml::createText(std::string c, int x, int y) {
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

int Sfml::Event(std::string *event)
{
    this->_window.clear();

    if (this->_window.isOpen()) {
        sf::sleep(sf::milliseconds(70));
        while (this->_window.pollEvent(this->_event)) {
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::Q)) {
                this->_window.close();
                return 3;
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::Z)) {
                return 2;
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::A)) {
                return 4;
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::R)) {
                return 5;
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::N)) {
                return 1;
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::M)) {
                return 6;
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::P)) {
                return 7;
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::W)) {
                return 8;
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::X)) {
                return 9;
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::Up)) {
                *event = "UP";        
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::Right)) {
                *event = "RIGHT";        
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::Left)) {
                *event = "LEFT";        
            }
            if ((this->_event.type == sf::Event::KeyPressed) && (this->_event.key.code == sf::Keyboard::Down)) {
                *event = "DOWN";        
            }
            return 0;
        }
    }
    return 200000;
}

void Sfml::Destroy()
{
    this->_window.close();
}
