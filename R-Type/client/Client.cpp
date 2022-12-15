/*
** EPITECH PROJECT, 2020
** client
** File description:
** cpp
*/

#include "Client.hpp"

void Client::Init()
{
    std::vector<std::string> tab;

    this->_init_game = 0;
    this->Igraphical = GraphicalFactory::CreateNewGraphical(
            GraphicalFactory::GraphType::SFML
            );
    this->IscreenView = ScreenViewFactory::CreateNewScreenViewFactory(
            ScreenViewFactory::ScreenType::MENU, tab
    );
}

Client::Client()
{
    Init();
    Draw();
}

void Client::Draw()
{
   
    while (this->Igraphical->WindowisOpen()) {
        this->_event = this->Igraphical->Event();
        Event();
        if (this->_event == 666)
            break;
        if (this->_init_game == 0) {
            this->Igraphical->Draw(this->IscreenView->Draw(), SMENU);
        }
        else if (this->_init_game == 1) {
            this->Igraphical->Draw(this->IscreenView->Draw(), SGAME);
        }
        else if (this->_init_game == 2) {
            this->Igraphical->Draw(this->IscreenView->Draw(), SSETTINGS);
        }
    }
}

void Client::Event()
{
     std::vector<std::string> tab;

    if (this->_event == 1) {
        this->IscreenView = ScreenViewFactory::CreateNewScreenViewFactory(ScreenViewFactory::ScreenType::GAME, tab);
        this->_init_game = 1;
    }
    if (this->_event == 2) {
        this->IscreenView = ScreenViewFactory::CreateNewScreenViewFactory(ScreenViewFactory::ScreenType::MENU, tab);
        this->_init_game = 0;
    }
    if (this->_event == 3) {
        this->IscreenView = ScreenViewFactory::CreateNewScreenViewFactory(ScreenViewFactory::ScreenType::SETTINGS, tab);
        this->_init_game = 2;
    }
    this->IscreenView->Event(this->_event);

}

Client::~Client()
{
//    delete Client();
}