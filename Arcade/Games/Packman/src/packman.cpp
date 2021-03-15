/*
** EPITECH PROJECT, 2020
** Packman
** File description:
** cpp
*/

#include "../include/packman.hpp"

std::vector<std::string> Packman::open_file(const char *text)
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

void Packman::Init()
{
    this->_score = 0;
    this->_draw = open_file("Games/Packman/packman.txt");
    this->_best_score = open_file("Games/Packman/score.txt");
    this->ghost1->_direction = "EMPTY";
    this->ghost2->_direction = "EMPTY";
    this->ghost3->_direction = "EMPTY";
    this->ghost4->_direction = "EMPTY";
}

int Packman::Event(std::string *event)
{
    add_ghost();
    this->_draw = this->ghost1->move(this->_draw, '+');
    this->_draw = this->ghost2->move(this->_draw, '-');
    this->_draw = this->ghost3->move(this->_draw, ';');
    this->_draw = this->ghost4->move(this->_draw, '?');
    if (check_goute() == 555) return (555);
    if (*event != "STOP") open_door();
    if (*event == "DOWN") return (Event_down());
    if (*event == "UP") return (Event_up());
    if (*event == "LEFT") return (Event_left());
    if (*event == "RIGHT") return (Event_right());
    return (0);
}

int Packman::check_goute()
{
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '.')
                return (0);
        }
    }
    return (555);
}

void Packman::add_ghost()
{
    int g1 = 0;
    int g2 = 0;
    int g3 = 0;
    int g4 = 0;

    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '+')
                g1 = 1;
            if (this->_draw[i][z] == '-')
                g2 = 1;
            if (this->_draw[i][z] == ';')
                g3 = 1;
            if (this->_draw[i][z] == '?')
                g4 = 1;
        }
    }
    if (g1 == 0) {
        for (int i = 17; i < 20 && g1 == 0; i++) {
            for (int z = 13; z < 16; z++) {
                if (this->_draw[i][z] == ' ') {
                    this->_draw[i][z] = '+';
                    g1 = 1;
                    break;
                }
            }
        }
    }
    if (g2 == 0) {
        for (int i = 17; i < 20 && g2 == 0; i++) {
            for (int z = 13; z < 16; z++) {
                if (this->_draw[i][z] == ' ') {
                    this->_draw[i][z] = '-';
                    g2 = 1;
                    break;
                }
            }
        }
    }
    if (g3 == 0) {
        for (int i = 17; i < 20 && g3 == 0; i++) {
            for (int z = 13; z < 16; z++) {
                if (this->_draw[i][z] == ' ') {
                    this->_draw[i][z] = ';';
                    g3 = 1;
                    break;
                }
            }
        }
    }
    if (g4 == 0) {
        for (int i = 17; i < 20 && g4 == 0; i++) {
            for (int z = 13; z < 16; z++) {
                if (this->_draw[i][z] == ' ') {
                    this->_draw[i][z] = '?';
                    g4 = 1;
                    break;
                }
            }
        }
    }
}

void Packman::open_door()
{
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == 'W') {
                this->_draw[i][z] = '.';
            }
        }
    }
}

int Packman::Event_up()
{
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '>') {
                if (this->_draw[i - 1][z] == ' ') {
                    this->_draw[i - 1][z] = '>';
                    this->_draw[i][z] = ' ';
                    return (0);
                } else if (this->_draw[i - 1][z] == '.') {
                    this->_score += 10;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i - 1][z] = '>';
                    this->_draw[i][z] = ' ';
                    return (0);
                } else if (this->_draw[i - 1][z] == '%') {
                    this->_score += 10;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i - 1][z] = '>';
                    this->_draw[i][z] = ' ';
                    this->_food = 3000;
                    return 0;
                } else if (this->_draw[i - 1][z] == '+' ||
                this->_draw[i - 1][z] == '-' ||
                this->_draw[i - 1][z] == ';' ||
                this->_draw[i - 1][z] == '?') {
                    if (this->_food == 0)
                        return 666;
                    this->_score += 100;
                    this->_draw[i - 1][z] = '>';
                    this->_draw[i][z] = ' ';
                    return 0;
                } else return 0;
            }
        }
    }
    return (0);
}

int Packman::Event_down()
{
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '>') {
                if (this->_draw[i + 1][z] == ' ') {
                    this->_draw[i + 1][z] = '>';
                    this->_draw[i][z] = ' ';
                    return (0);
                } else if (this->_draw[i + 1][z] == '.') {
                    this->_score += 10;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i + 1][z] = '>';
                    this->_draw[i][z] = ' ';
                    return 0;
                } else if (this->_draw[i + 1][z] == '%') {
                    this->_score += 10;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i + 1][z] = '>';
                    this->_draw[i][z] = ' ';
                    this->_food = 3000;
                    return 0;
                } else if (this->_draw[i + 1][z] == '-' ||
                this->_draw[i + 1][z] == '+' ||
                this->_draw[i + 1][z] == ';' ||
                this->_draw[i + 1][z] == '?') {
                    if (this->_food == 0)
                        return 666;
                    this->_draw[i + 1][z] = '>';
                    this->_draw[i][z] = ' ';
                    return (0);
                } else return (0);
            }
        }
    }
    return (0);
}

int Packman::Event_left()
{
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '>') {
                if (this->_draw[i][z - 1] == ' ') {
                    this->_draw[i][z - 1] = '>';
                    this->_draw[i][z] = ' ';
                    return (0);
                } else if (this->_draw[i][z - 1] == ',') {
                    this->_draw[i][27] = '>';
                    this->_draw[i][z] = ' ';
                } else if (this->_draw[i][z - 1] == '.') {
                    this->_score += 10;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i][z - 1] = '>';
                    this->_draw[i][z] = ' ';
                    return 0;
                } else if (this->_draw[i][z - 1] == '%') {
                    this->_score += 10;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i][z - 1] = '>';
                    this->_draw[i][z] = ' ';
                    this->_food = 3000;
                    return 0;
                } else if (this->_draw[i][z - 1] == '+' ||
                this->_draw[i][z - 1] == '-' ||
                this->_draw[i][z - 1] == ';' ||
                this->_draw[i][z - 1] == '?') {
                    if (this->_food == 0)
                        return 666;
                    this->_draw[i][z - 1] = '>';
                    this->_draw[i][z] = ' ';
                    return (0);
                } else return (0);
            }
        }
    }
    return (0);
}

int Packman::Event_right()
{
    for (int i = 0; i < this->_draw.size(); i++) {
        for (int z = 0; z < this->_draw[i].size(); z++) {
            if (this->_draw[i][z] == '>') {
                if (this->_draw[i][z + 1] == ' ') {
                    this->_draw[i][z + 1] = '>';
                    this->_draw[i][z] = ' ';
                    return (0);
                } else if (this->_draw[i][z + 1] == ',') {
                    this->_draw[i][1] = '>';
                    this->_draw[i][z] = ' ';                    
                } else if (this->_draw[i][z + 1] == '.') {
                    this->_score += 10;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i][z + 1] = '>';
                    this->_draw[i][z] = ' ';
                    return 0;
                } else if (this->_draw[i][z + 1] == '%') {
                    this->_score += 10;
                    if (this->_score >= std::atoi(this->_best_score[0].c_str()))
                        this->_best_score[0] = std::to_string(this->_score);
                    this->_draw[i][z + 1] = '>';
                    this->_draw[i][z] = ' ';
                    this->_food = 3000;
                    return 0;
                } else if (this->_draw[i][z + 1] == '+' ||
                this->_draw[i][z + 1] == '-' ||
                this->_draw[i][z + 1] == ';' ||
                this->_draw[i][z + 1] == '?') {
                    if (this->_food != 0) {
                        this->_draw[i][z + 1] = '>';
                        this->_draw[i][z] = ' ';
                        return 0;
                    }
                    return 666;
                } else return (0);
            }
        }
    }
    return (0);
}

void Packman::Destroy()
{
    std::ofstream ofs;

    if (std::stoi(this->_best_score[0]) <= this->_score) {
        ofs.open("Games/Packman/score.txt", std::ofstream::out | std::ofstream::trunc);
        ofs << this->_score;
        ofs.close();
    }
}

std::vector<std::string> Packman::Draw()
{
    if (this->_draw.back() == "FOOD")
        this->_draw.pop_back();
    this->_draw.back() = "Best Score: " + this->_best_score[0];
    this->_draw[1] =  "Score: " + std::to_string(this->_score);
    if (this->_food != 0) {
        this->_food -= 50;
        this->_draw.push_back("FOOD");
    }
    return (this->_draw);
}


std::vector<std::string> Packman::Ghost::move(std::vector<std::string> _draw, char c)
{
    int z = 0;
    std::vector<std::string> _randomVerti;
    std::vector<std::string> _randomHoriz;
    int j = 0;
    int m = 0;
    int posx = 0;
    int posy = 0;

    for (; posy < _draw.size(); posy++) {
        for (posx = 0; posx < _draw[posy].size(); posx++) {
            if (_draw[posy][posx] == c) {
                if (_draw[posy - 1][posx] == ' ' || _draw[posy - 1][posx] == '.' || _draw[posy - 1][posx] == '%')
                    _randomVerti.push_back("up");
                if (_draw[posy + 1][posx] == ' ' || _draw[posy + 1][posx] == '.' || _draw[posy + 1][posx] == '%')
                    _randomVerti.push_back("down");
                if (_draw[posy][posx - 1] == ' ' || _draw[posy][posx - 1] == '.' || _draw[posy][posx - 1] == '%')
                    _randomHoriz.push_back("left");
                if (_draw[posy][posx + 1] == ' ' || _draw[posy][posx + 1] == '.' || _draw[posy][posx + 1] == '%')
                    _randomHoriz.push_back("right");
                j = 1;
                break;
            }
        }
        if (j == 1)
            break;
    }
    if (_randomHoriz.size() >= 1 && _randomVerti.size() >= 1) {
        z = rand() % 4;
        if (z >= 2) {
            m = rand() % _randomVerti.size();
            this->_direction = _randomVerti[m];
        } else {
            m = rand() % _randomHoriz.size();
            this->_direction = _randomHoriz[m];
        }
    } else if (this->_direction == "EMPTY" && _randomHoriz.size() == 2) {
        z = rand() % 2;
        this->_direction = _randomHoriz[z];        
    } else if (this->_direction == "EMPTY" && _randomVerti.size() == 2) {
        z = rand() % 2;
        this->_direction = _randomVerti[z];
    } else if (_randomVerti.size() == 1 && _randomHoriz.size() < 1)
        this->_direction = _randomVerti[0];
    else if (_randomVerti.size() < 1 && _randomHoriz.size() == 1)
        this->_direction = _randomHoriz[0];
    if (this->_direction == "up")
        return this->Ghost::up(_draw, c, posx, posy);
    else if (this->_direction == "down")
        return this->Ghost::down(_draw, c, posx, posy);
    else if (this->_direction == "right")
        return this->Ghost::right(_draw, c, posx, posy);
    else if (this->_direction == "left")
        return this->Ghost::left(_draw, c, posx, posy);
    return _draw;
}

std::vector<std::string> Packman::Ghost::up(std::vector<std::string> _draw, char c, int z, int i)
{
    if (_draw[i - 1][z] == ' ') {
        if (passageOnFood == 1) {
            _draw[i - 1][z] = c;
            _draw[i][z] = '%';
        }
        else if (passageOnPoint == 1) {
            _draw[i - 1][z] = c;
            _draw[i][z] = '.';
        } else {
            _draw[i - 1][z] = c;
            _draw[i][z] = ' ';
        }
        passageOnSpace = 1;
        passageOnFood = 0;
        passageOnPoint = 0;

        return _draw;
    } else if (_draw[i - 1][z] == '.') {
        if (passageOnFood == 1) {
            _draw[i - 1][z] = c;
            _draw[i][z] = '%';
        }
        else if (passageOnSpace == 1) {
            _draw[i - 1][z] = c;
            _draw[i][z] = ' ';
        } else {
            _draw[i - 1][z] = c;
            _draw[i][z] = '.';
        }
        passageOnFood = 0;
        passageOnSpace = 0;
        passageOnPoint = 1;
        return _draw;
    } else if (_draw[i - 1][z] == '%') {
        if (passageOnPoint == 1) {
            _draw[i - 1][z] = c;
            _draw[i][z] = '.';
        }
        else if (passageOnSpace == 1) {
            _draw[i - 1][z] = c;
            _draw[i][z] = ' ';
        }
        passageOnSpace = 0;
        passageOnPoint = 0;
        passageOnFood = 1;
        return _draw;
    }
    return _draw;
}

std::vector<std::string> Packman::Ghost::down(std::vector<std::string> _draw, char c, int z, int i)
{
    if (_draw[i + 1][z] == ' ') {
        if (passageOnFood == 1) {
            _draw[i + 1][z] = c;
            _draw[i][z] = '%';
        }
        else if (passageOnPoint == 1) {
            _draw[i + 1][z] = c;
            _draw[i][z] = '.';
        } else {
            _draw[i + 1][z] = c;
            _draw[i][z] = ' ';
        }
        passageOnSpace = 1;
        passageOnFood = 0;
        passageOnPoint = 0;

        return _draw;
    } else if (_draw[i + 1][z] == '.') {
        if (passageOnFood == 1) {
            _draw[i + 1][z] = c;
            _draw[i][z] = '%';
        }
        else if (passageOnSpace == 1) {
            _draw[i + 1][z] = c;
            _draw[i][z] = ' ';
        } else {
            _draw[i + 1][z] = c;
            _draw[i][z] = '.';
        }
        passageOnPoint = 1;
        passageOnFood = 0;
        passageOnSpace = 0;
        return _draw;
    } else if (_draw[i + 1][z] == '%') {
        if (passageOnSpace == 1) {
            _draw[i + 1][z] = c;
            _draw[i][z] = ' ';
        }
        else if (passageOnPoint == 1) {
            _draw[i + 1][z] = c;
            _draw[i][z] = '.';
        }
        passageOnFood = 1;
        passageOnSpace = 0;
        passageOnPoint = 0;

        return _draw;
    }
    return _draw;
}

std::vector<std::string> Packman::Ghost::right(std::vector<std::string> _draw, char c, int z, int i)
{
    if (_draw[i][z + 1] == ' ') {
        if (passageOnFood == 1) {
            _draw[i][z + 1] = c;
            _draw[i][z] = '%';
        }
        else if (passageOnPoint == 1) {
            _draw[i][z + 1] = c;
            _draw[i][z] = '.';
        } else {
            _draw[i][z + 1] = c;
            _draw[i][z] = ' ';
        }
        passageOnSpace = 1;
        passageOnFood = 0;
        passageOnPoint = 0;
        return _draw;
    } else if (_draw[i][z + 1] == '.') {
        if (passageOnFood == 1) {
            _draw[i][z + 1] = c;
            _draw[i][z] = '%';
        }
        else if (passageOnSpace == 1) {
            _draw[i][z + 1] = c;
            _draw[i][z] = ' ';
        } else {
            _draw[i][z + 1] = c;
            _draw[i][z] = '.';
        }
        passageOnFood = 0;
        passageOnSpace = 0;
        passageOnPoint = 1;
        return _draw;
    } else if (_draw[i][z + 1] == '%') {
         if (passageOnSpace == 1) {
            _draw[i][z + 1] = c;
            _draw[i][z] = ' ';
        }
        else if (passageOnPoint == 1) {
            _draw[i][z + 1] = c;
            _draw[i][z] = '.';
        }
        passageOnFood = 1;
        passageOnPoint = 0;
        passageOnSpace = 0;

        return _draw;
    }
    return _draw;
}

std::vector<std::string> Packman::Ghost::left(std::vector<std::string> _draw, char c, int z, int i)
{
    if (_draw[i][z - 1] == ' ') {
        if (passageOnFood == 1) {
            _draw[i][z - 1] = c;
            _draw[i][z] = '%';
        }
        else if (passageOnPoint == 1) {
            _draw[i][z - 1] = c;
            _draw[i][z] = '.';
        } else {
            _draw[i][z - 1] = c;
            _draw[i][z] = ' ';
        }
        passageOnFood = 0;
        passageOnPoint = 0;
        passageOnSpace = 1;
        return _draw;
    } else if (_draw[i][z - 1] == '.') {
        if (passageOnFood == 1) {
            _draw[i][z - 1] = c;
            _draw[i][z] = '%';
        }
        else if (passageOnSpace == 1) {
            _draw[i][z - 1] = c;
            _draw[i][z] = ' ';
        } else {
            _draw[i][z - 1] = c;
            _draw[i][z] = '.';
        }
        passageOnFood = 0;
        passageOnSpace = 0;
        passageOnPoint = 1;
        return _draw;
    } else if (_draw[i][z - 1] == '%') {
        if (passageOnSpace == 1) {
            _draw[i][z - 1] = c;
            _draw[i][z] = ' ';
        }
        else if (passageOnPoint == 1) {
            _draw[i][z - 1] = c;
            _draw[i][z] = '.';
        }
        passageOnFood = 1;
        passageOnPoint = 0;
        passageOnSpace = 0;
        return _draw;
    }
    return _draw;
}