/*
** EPITECH PROJECT, 2020
** core
** File description:
** hpp
*/

#ifndef _LOOSE_HPP_
#define _LOOSE_HPP_

#include "../../include/IGameModule.hpp"

class Loose : public IGameModule {
    public:
        virtual void Init();
        virtual std::vector<std::string> Draw();
        virtual void Destroy();
        virtual int Event(std::string *);
        std::vector<std::string> open_file(const char *);
    private:
        std::vector<std::string> _Loose;
};

extern "C" IGameModule *Create()
{
    return new Loose();
}

#endif