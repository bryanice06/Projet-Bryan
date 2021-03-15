/*
** EPITECH PROJECT, 2020
** core
** File description:
** hpp
*/

#ifndef _Sdl_HPP_
#define _Sdl_HPP_

#include	<map>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_events.h>
#include <SDL2/SDL_ttf.h>
#include "../../include/IGraphicalsModule.hpp"

class Sdl: public IGraphicalsModule {
    public:
        virtual void Init();
        virtual int Event(std::string *);
        virtual void Destroy();
        virtual void Draw(const std::vector<std::string>);
        bool WindowisOpen();
        void createText(std::string, int, int);
        void CreatePixel(std::string, int, int, int, int);
        void createRect(SDL_Rect *, int, int, int, int);
    private:
        bool isopen = false;
        SDL_Window* window;
        SDL_Surface* pwindow;
        SDL_Event _event;
        SDL_Renderer *render;
        SDL_Rect offset;
        TTF_Font *_font;
};

extern "C" IGraphicalsModule *Create()
{
        return new Sdl();
}

#endif