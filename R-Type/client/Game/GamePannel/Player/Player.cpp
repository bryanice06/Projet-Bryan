/*
** EPITECH PROJECT, 2020
** player
** File description:
** cpp
*/

#include "Player.hpp"

Player::Player(std::vector <std::string> player)
{
    this->_connect = player[0];
    this->_color = player[1];
    this->_score = player[2];
    this->_life = player[3];
}

Player::~Player() {}