/*
** EPITECH PROJECT, 2020
** Nibbler
** File description:
** cpp
*/

#include "../include/nibbler.hpp"

std::vector<std::string> Nibbler::open_file(const char *text)
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

void Nibbler::Init()
{
    for (int i = 0; i < 2; i++)
        this->_save_move.insert(this->_save_move.begin(), "right");
    this->_score = 0;
    this->_draw = open_file("Games/Nibbler/nibbler.txt");
    this->_best_score = open_file("Games/Nibbler/score.txt");
}

int Nibbler::Event(std::string *event)
{
    if (*event == "DOWN")
        return (Event_down());
    if (*event == "UP")
        return (Event_up());
    if (*event == "LEFT")
        return (Event_left());
    if (*event == "RIGHT")
        return (Event_right());
    return (0);
}

void Nibbler::delete_queue()
{
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '!') {
                if (this->_save_move.back() == "up") {
                    this->_draw[i - 1][z] = '!';
                    this->_draw[i][z] = ' ';
                }
                if (this->_save_move.back() == "down") {
                    this->_draw[i + 1][z] = '!';
                    this->_draw[i][z] = ' ';
                }
                if (this->_save_move.back() == "right") {
                    this->_draw[i][z + 1] = '!';
                    this->_draw[i][z] = ' ';
                }
                if (this->_save_move.back() == "left") {
                    this->_draw[i][z - 1] = '!';
                    this->_draw[i][z] = ' ';
                }
                this->_save_move.pop_back();
                return;
            }
        }
    }
}

void Nibbler::change_fruit()
{
    int x = rand() % 20 + 3;
    int y = rand () % 19 + 3;

    if (this->_draw[x][y] == ' ')
        this->_draw[x][y] = ']';
    else
        change_fruit();
}

int Nibbler::Event_up()
{
    this->_save_move.insert(this->_save_move.begin(), "up");
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '/') {
                if (this->_draw[i - 1][z] == ' ') {
                    this->_draw[i - 1][z] = '/';
                    this->_draw[i][z] = 'q';
                    delete_queue();
                    return (0);
                } else if (this->_draw[i - 1][z] == ']') {
                    this->_score += 1;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i - 1][z] = '/';
                    this->_draw[i][z] = 'q';
                    change_fruit();
                    return (0);
                } else return (666);
            }
        }
    }
    return (0);
}

int Nibbler::Event_down()
{
    this->_save_move.insert(this->_save_move.begin(), "down");
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '/') {
                if (this->_draw[i + 1][z] == ' ') {
                    this->_draw[i + 1][z] = '/';
                    this->_draw[i][z] = 'q';
                    delete_queue();
                    return (0);
                } else if (this->_draw[i + 1][z] == ']') {
                    this->_score += 1;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i + 1][z] = '/';
                    this->_draw[i][z] = 'q';
                    change_fruit();
                    return (0);
                } else return (666);
            }
        }
    }
    return (0);
}

int Nibbler::Event_left()
{
    this->_save_move.insert(this->_save_move.begin(), "left");
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '/') {
                if (this->_draw[i][z - 1] == ' ') {
                    this->_draw[i][z - 1] = '/';
                    this->_draw[i][z] = 'q';
                    delete_queue();
                    return (0);
                } else if (this->_draw[i][z - 1] == ']') {
                    this->_score += 1;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i][z - 1] = '/';
                    this->_draw[i][z] = 'q';
                    change_fruit();
                    return (0);
                } else return (666);
            }
        }
    }
    return (0);
}

int Nibbler::Event_right()
{
    this->_save_move.insert(this->_save_move.begin(), "right");
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '/') {
                if (this->_draw[i][z + 1] == ' ') {
                    this->_draw[i][z + 1] = '/';
                    this->_draw[i][z] = 'q';
                    delete_queue();
                    return (0);
                } else if (this->_draw[i][z + 1] == ']') {
                    this->_score += 1;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i][z + 1] = '/';
                    this->_draw[i][z] = 'q';
                    change_fruit();
                    return (0);
                } else return (666);
            }
        }
    }
    return (0);
}

void Nibbler::Destroy()
{
    std::ofstream ofs;

    if (std::stoi(this->_best_score[0]) <= this->_score) {
        ofs.open("Games/Nibbler/score.txt", std::ofstream::out | std::ofstream::trunc);
        ofs << this->_score;
        ofs.close();
    }
}

std::vector<std::string> Nibbler::Draw()
{
    this->_draw.back() = "Best Score: " + this->_best_score[0];
    this->_draw[1] =  std::to_string(this->_score) + " Score";
    return (this->_draw);
}
