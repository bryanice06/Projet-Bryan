/*
** EPITECH PROJECT, 2020
** Menu
** File description:
** cpp
*/

#include "../include/menu.hpp"

std::vector<std::string> Menu::open_file(const char *text)
{
    std::ifstream file(text, std::ios::in);
    std::vector<std::string> tab;
    std::string line;

    while (!file.eof()) {
        std::getline(file, line);
        tab.push_back(line);
    }
    file.close();
    return (tab);
}

void Menu::Init()
{
    this->_menu = open_file("Games/Menu/menu.txt");
}

int Menu::Event(std::string *event)
{
    return (1);
}

void Menu::Destroy()
{
    std::cout << "Function Destroy Menu" << std::endl;
}

std::vector<std::string> Menu::Draw()
{
    return (this->_menu);
}
