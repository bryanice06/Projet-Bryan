//
// Created by tjeanningros on 31/10/2020.
//

#ifndef R_TYPE_SETTINGS_HPP
#define R_TYPE_SETTINGS_HPP

#include "../IScreenView.hpp"

class Settings: public IScreenView {
public:
    Settings(std::vector<std::string>);
    virtual void Init(std::vector<std::string>);
    virtual void Event(int);
    virtual std::vector<GameObject*> Draw();
private:

    std::vector<GameObject*> _SettingsObject;
};


#endif //R_TYPE_SETTINGS_HPP
