//
// Created by tjeanningros on 30/10/2020.
//

#ifndef R_TYPE_GRAPHFACTORY_H
#define R_TYPE_GRAPHFACTORY_H

#include "Sfml.hpp"

class GraphicalFactory {
    public:
        enum GraphType {
            SFML,
        };
        static IGraphical *CreateNewGraphical(GraphType graphType) {
            switch (graphType) {
                default:
                case SFML:
                    return new Sfml;
            }
        }
};
#endif //R_TYPE_GRAPHFACTORY_H
