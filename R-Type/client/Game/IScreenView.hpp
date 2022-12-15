//
// Created by tjeanningros on 30/10/2020.
//

#ifndef R_TYPE_ISCREENVIEW_HPP
#define R_TYPE_ISCREENVIEW_HPP

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <ostream>
#include <dlfcn.h>
#include <dirent.h>
#include <grp.h>
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <vector>
#include <iostream>
#include "GameObject.hpp"


class IScreenView {
    public:
        virtual void Init(std::vector<std::string>) = 0;
        virtual std::vector<GameObject*> Draw() = 0;
        virtual void Event(int) = 0;
};

#endif //R_TYPE_ISCREENVIEW_HPP
