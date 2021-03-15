/*
** EPITECH PROJECT, 2020
** core
** File description:
** hpp
*/

#ifndef _WIN_HPP_
#define _WIN_HPP_

#include "../../include/IGameModule.hpp"

class Win : public IGameModule {
    public:
        virtual void Init();
        virtual std::vector<std::string> Draw();
        virtual void Destroy();
        virtual int Event(std::string *);
        std::vector<std::string> open_file(const char *);
    private:
        std::vector<std::string> _Win;
};

extern "C" IGameModule *Create()
{
    return new Win();
}

#endif