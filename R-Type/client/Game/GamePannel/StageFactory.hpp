//
// Created by tjeanningros on 12/11/2020.
//

#ifndef R_TYPE_ISTAGEFACTORY_HPP
#define R_TYPE_ISTAGEFACTORY_HPP

#include "Stage1/Stage1.hpp"
#include "Stage2/Stage2.hpp"
#include "Stage3/Stage3.hpp"
#include "Win/Win.hpp"
#include "Loose/Loose.hpp"

class StageFactory {
    public:
        enum StageType {
            STAGE1,
            STAGE2,
            STAGE3,
            WIN,
            LOOSE,
        };
        static IStage *CreateNewStageFactory(StageType stageType, std::vector<GameObject*> _gameObject) {
            switch (stageType) {
                default:
                case STAGE1:
                    return new Stage1(_gameObject);
                case STAGE2:
                    return new Stage2(_gameObject);
                case STAGE3:
                    return new Stage3(_gameObject);
                case WIN:
                    return new Win(_gameObject);
                case LOOSE:
                    return new Loose(_gameObject);
            }
        }
};

#endif //R_TYPE_ISTAGEFACTORY_HPP
