/*
** EPITECH PROJECT, 2020
** Loose
** File description:
** cpp
*/

#include "../include/loose.hpp"

std::vector<std::string> Loose::open_file(const char *text)
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

void Loose::Init()
{
    this->_Loose = open_file("Games/Loose/loose.txt");
}

int Loose::Event(std::string *event)
{
    return (1);
}

void Loose::Destroy()
{
}

std::vector<std::string> Loose::Draw()
{
    return (this->_Loose);
}
