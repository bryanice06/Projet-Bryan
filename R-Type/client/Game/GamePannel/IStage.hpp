//
// Created by tjeanningros on 12/11/2020.
//

#ifndef R_TYPE_ISTAGE_HPP
#define R_TYPE_ISTAGE_HPP

class IStage {
    public:
        virtual void Init() = 0;
        virtual std::vector<GameObject*> getTab() = 0;
        virtual void Event(int, std::vector<GameObject*>) = 0;
};

#endif //R_TYPE_ISTAGE_HPP
