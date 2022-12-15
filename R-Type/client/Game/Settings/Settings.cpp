//
// Created by tjeanningros on 31/10/2020.
//

#include "Settings.hpp"
Settings::Settings(std::vector<std::string> tab)
{
    Init(tab);
}

void Settings::Init(std::vector<std::string> player)
{
    this->_SettingsObject.push_back(new GameObject(0, 0, BACKGROUNDCREDIT, 1920, 1080, SSETTINGS, ButtonAction::NOTHING, {0,0}));
    this->_SettingsObject.push_back(new GameObject(788, 760, BUTTONMENU, 400, 131, SSETTINGS, ButtonAction::GOTOMENU, {0 ,0}));
}

void Settings::Event(int event) {}

std::vector<GameObject*> Settings::Draw()
{
    return (this->_SettingsObject);
}