/*
** EPITECH PROJECT, 2020
** core
** File description:
** hpp
*/

#ifndef _PACKMAN_HPP_
#define _PACKMAN_HPP_

#include "../../include/IGameModule.hpp"

class Packman : public IGameModule {
    public:
        virtual void Init();
        virtual std::vector<std::string> Draw();
        virtual void Destroy();
        virtual int Event(std::string *);
        std::vector<std::string> open_file(const char *);
        int Event_up();
        int Event_left();
        int Event_down();
        int Event_right();
        void open_door();
        void add_ghost();
        int check_goute();
        class Ghost {
            public:
                Ghost() {};
                ~Ghost() {};
                void dead();
                std::vector<std::string> move(std::vector<std::string>, char);
                std::vector<std::string> up(std::vector<std::string>, char, int, int);
                std::vector<std::string> down(std::vector<std::string>, char, int, int);
                std::vector<std::string> left(std::vector<std::string>, char, int, int);
                std::vector<std::string> right(std::vector<std::string>, char, int, int);
                std::string _direction;
            private:
                int passageOnFood = 0;
                int passageOnPoint = 0;
                int passageOnSpace = 0;
        };
    private:
        Ghost *ghost1 = new Ghost();
        Ghost *ghost2 = new Ghost();
        Ghost *ghost3 = new Ghost();
        Ghost *ghost4 = new Ghost();
        std::vector<std::string> _draw;
        std::vector<std::string> _best_score;
        int _score;
        int _food;
        
};

extern "C" IGameModule *Create()
{
    return new Packman();
}

#endif
