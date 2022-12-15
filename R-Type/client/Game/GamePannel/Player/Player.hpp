/*
** EPITECH PROJECT, 2020
** player
** File description:
** hpp
*/

#ifndef _PLAYER_HPP_
#define _PLAYER_HPP_

#include <string>
#include <vector>

class Player {
    public:
        Player(std::vector<std::string>);
        ~Player();
    private:
        std::string _connect;
        std::string _life;
        std::string _score;
        std::string _color;
};

#endif