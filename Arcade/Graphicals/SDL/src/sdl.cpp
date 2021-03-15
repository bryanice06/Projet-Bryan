/*
** EPITECH PROJECT, 2020
** Sdl
** File description:
** cpp
*/

#include "../include/sdl.hpp"

void Sdl::Init()
{
    SDL_Init(0);
    this->window = SDL_CreateWindow("SDL", 0, 0,
    1900, 1000, SDL_WINDOW_SHOWN);
    if (TTF_Init() == -1)
        std::cout << "TTF_init bad" << std::endl;
    this->_font = TTF_OpenFont("Graphicals/sf_slapstick_comic_shaded.ttf", 45);
        
    IMG_Init(IMG_INIT_PNG);
    this->render = SDL_CreateRenderer(this->window, -1, SDL_RENDERER_ACCELERATED);
    this->pwindow = SDL_GetWindowSurface(this->window);
}

void Sdl::Draw(const std::vector<std::string> draw)
{
    int z = 0;
    int sizey = 0;
    int posy = 0;

    int color_ghost = 0;
    std::vector<std::string> ghost1;
    ghost1.push_back("Graphicals/assets/ghost1.png");
    ghost1.push_back("Graphicals/assets/ghostCanDie.png");
    std::vector<std::string> ghost2;
    ghost2.push_back("Graphicals/assets/ghost2.png");
    ghost2.push_back("Graphicals/assets/ghostCanDie.png");
    std::vector<std::string> ghost3;
    ghost3.push_back("Graphicals/assets/ghost3.png");
    ghost3.push_back("Graphicals/assets/ghostCanDie.png");
    std::vector<std::string> ghost4;
    ghost4.push_back("Graphicals/assets/ghost4.png");
    ghost4.push_back("Graphicals/assets/ghostCanDie.png");

    if (this->WindowisOpen()) {
        if (draw.back() == "FOOD")
            color_ghost = 1;              
        for (int i = 0; i < draw.size(); i++) {
            for (int y = 0; y < draw[i].size(); y++) {
                std::string s(1, draw[i][y]);   
                if (draw[i][y] == 'q' || draw[i][y] == '!')
                    this->CreatePixel("Graphicals/assets/snakeCore.png", 20, 20, y * 20 + 710, z * 20);                
                else if (draw[i][y] == ']')
                    this->CreatePixel("Graphicals/assets/cerise.png", 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == '/')
                    this->CreatePixel("Graphicals/assets/snakeHead.png", 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == '*')
                    this->CreatePixel("Graphicals/assets/block.png", 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == 'W')
                    this->CreatePixel("Graphicals/assets/blockred.png", 20, 20, y * 20 + 710, z * 20);                        
                else if (draw[i][y] == ' ')
                    this->CreatePixel("Graphicals/assets/blackRect.png", 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == '_' && draw.size() > 16)
                    this->CreatePixel("Graphicals/assets/cianRect.png", 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == '>' && draw.size() > 16)
                    this->CreatePixel("Graphicals/assets/pacman.png", 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == '+' && draw.size() > 16)
                    this->CreatePixel(ghost1[color_ghost], 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == '-' && draw.size() > 16)
                    this->CreatePixel(ghost2[color_ghost], 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == ';' && draw.size() > 16)
                    this->CreatePixel(ghost3[color_ghost], 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == '?' && draw.size() > 16)
                    this->CreatePixel(ghost4[color_ghost], 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == '.' && draw.size() > 16)
                    this->CreatePixel("Graphicals/assets/point.png", 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] == '%' && draw.size() > 16)
                    this->CreatePixel("Graphicals/assets/food.png", 20, 20, y * 20 + 710, z * 20);
                else if (draw[i][y] != ',')
                    this->createText(s, y * 20 + 710, z * 20 );
            }
            z++;
        }
        SDL_RenderPresent(this->render);
    }
}

void Sdl::CreatePixel(std::string c, int width, int height, int x, int y) {

    SDL_Surface *sprite;
    SDL_Texture *texture;

    texture = IMG_LoadTexture(this->render, c.c_str());
    this->createRect(&offset, width, height, x, y);
    SDL_RenderCopy(this->render, texture, NULL, &offset);
    SDL_DestroyTexture(texture);
}

void Sdl::createRect(SDL_Rect *offset, int w, int h, int x, int y)
{
    offset->w = w;
    offset->h = h;
    offset->x = x;
    offset->y = y;
}

void Sdl::createText(std::string c, int x, int y) {
    
    SDL_Surface *text = NULL;
    SDL_Texture *texture = NULL;
    
    SDL_Color Color = { 255, 255, 255, 1};

    if (_font) {
        text = TTF_RenderText_Solid(_font, c.c_str(), Color);
        if (text) {
            this->offset.x = x;
            this->offset.y = y;
            this->offset.w = 25;
            this->offset.h = 25;
            texture = SDL_CreateTextureFromSurface(this->render, text);
            if (texture)
                SDL_RenderCopy(this->render, texture, NULL, &this->offset);
            else
                std::cout << "texture bad" << std::endl;        
        } else {
            std::cout << "text bad" << std::endl;
        }
    } else {
        std::cout << "font bad" << std::endl;
    }
    SDL_DestroyTexture(texture);

}
bool Sdl::WindowisOpen() {

    if (this->window == NULL || this->isopen) {

        SDL_Quit();
        return false;
    } else 
        return true;
}

int Sdl::Event(std::string *event)
{
    SDL_RenderClear(this->render);

    if (WindowisOpen()) {
        SDL_Delay(70);
        while (SDL_PollEvent(&this->_event)) {
            if (this->_event.key.keysym.sym == 'q' || (this->_event.type == SDL_QUIT)) {
                this->isopen = true;
                exit(EXIT_SUCCESS);
                return 3;
            }
            if (this->_event.key.keysym.sym == 'z') {
                SDL_DestroyWindow(this->window);
                return 2;
            }
            if (this->_event.key.keysym.sym == 'a') {
                SDL_DestroyWindow(this->window);
                return 4;
            }
            if (this->_event.key.keysym.sym == 'r') {
                SDL_DestroyWindow(this->window);
                return 5;
            }
            if (this->_event.key.keysym.sym == 'n') {
                SDL_DestroyWindow(this->window);
                return 1;
            }
            if (this->_event.key.keysym.sym == 'm') {
                SDL_DestroyWindow(this->window);
                return 6;
            }
            if (this->_event.key.keysym.sym == 'p') {
                SDL_DestroyWindow(this->window);
                return 7;
            }
            if (this->_event.key.keysym.sym == 'w') {
                SDL_DestroyWindow(this->window);
                return 8;
            }
            if (this->_event.key.keysym.sym == 'x') {
                SDL_DestroyWindow(this->window);
                return 9;
            }
            if (this->_event.key.keysym.sym == SDLK_UP) {
                *event = "UP";        
            }
            if (this->_event.key.keysym.sym == SDLK_RIGHT) {
                *event = "RIGHT";        
            }
            if (this->_event.key.keysym.sym == SDLK_LEFT) {
                *event = "LEFT";
            }
            if (this->_event.key.keysym.sym == SDLK_DOWN) {
                *event = "DOWN";        
            }
            return 0;
        }
    }
    return 200000;
}

void Sdl::Destroy()
{
    SDL_DestroyWindow(this->window);
    TTF_CloseFont(this->_font);
    TTF_Quit();
    SDL_Quit();
}
