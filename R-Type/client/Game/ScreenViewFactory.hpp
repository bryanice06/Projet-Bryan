//
// Created by tjeanningros on 30/10/2020.
//

#ifndef R_TYPE_SCREENVIEWFACTORY_HPP
#define R_TYPE_SCREENVIEWFACTORY_HPP

#include "Game.hpp"
#include "Menu/Menu.hpp"
#include "Settings/Settings.hpp"

class ScreenViewFactory {
    public:
        enum ScreenType {
            GAME,
            MENU,
            SETTINGS,
        };
        static IScreenView *CreateNewScreenViewFactory(ScreenType screenType, std::vector<std::string> list) {
            switch (screenType) {
                default:
                case GAME:
                    return new Game(list);
                case MENU:
                    return new Menu(list);
                case SETTINGS:
                    return new Settings(list);
            }
        }
};
#endif //R_TYPE_SCREENVIEWFACTORY_HPP
