/*
** EPITECH PROJECT, 2020
** core
** File description:
** hpp
*/

#ifndef _NIBBLER_HPP_
#define _NIBBLER_HPP_

#include "../../include/IGameModule.hpp"

class Nibbler : public IGameModule {
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
        void delete_queue();
        void change_fruit();
    private:
        std::vector<std::string> _draw;
        std::vector<std::string> _best_score;
        std::vector<std::string> _save_move;
        int _score;
};

extern "C" IGameModule *Create()
{
    return new Nibbler();
}

#endif
