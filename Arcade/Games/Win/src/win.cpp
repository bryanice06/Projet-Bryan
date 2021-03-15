/*
** EPITECH PROJECT, 2020
** Win
** File description:
** cpp
*/

#include "../include/win.hpp"

std::vector<std::string> Win::open_file(const char *text)
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

void Win::Init()
{
    this->_Win = open_file("Games/Win/win.txt");
}

int Win::Event(std::string *event)
{
    return (1);
}

void Win::Destroy()
{
}

std::vector<std::string> Win::Draw()
{
    return (this->_Win);
}
