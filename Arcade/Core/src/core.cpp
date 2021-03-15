/*
** EPITECH PROJECT, 2020
** core
** File description:
** cpp
*/

#include "../include/core.hpp"

Core::Core(const std::string &nameLib)
{
    this->handl_graph = NULL;
    this->handl_game = NULL;
    this->no_init_game = 0;
    this->_nameLib_game = "games_base/lib_arcade_menu.so";
    this->_event = "STOP";
    Init_tab_lib_graphical(nameLib);
}

void Core::Init_tab_lib_graphical(const std::string &nameLib)
{
    DIR *dir;
    struct dirent *dr;
    std::vector<std::string> tab;

    if ((dir = opendir("lib/")) == NULL) {
        std::cerr << "Cannot open folder: lib/" << std::endl;
        exit(84);
    }
    while ((dr = readdir(dir)) != NULL) {
        if (dr->d_name[0] != '.')
            tab.push_back(dr->d_name);
    }
    closedir(dir);
    for (int i = 0; i < tab.size(); i++) {
        if (tab[i].compare(0, 11, "lib_arcade_") == 0 && tab[i].compare(tab[i].size()-3, 3, ".so") == 0)
            this->tab_change_lib.push_back("lib/" + tab[i]);
    }
    Init_tab_lib_game(nameLib);
}

void Core::Init_tab_lib_game(const std::string &nameLib)
{
    DIR *dir;
    struct dirent *dr;
    std::vector<std::string> tab;

    if ((dir = opendir("games/")) == NULL) {
        std::cerr << "Cannot open folder: games/" << std::endl;
        exit(84);
    }
    while ((dr = readdir(dir)) != NULL) {
        if (dr->d_name[0] != '.')
            tab.push_back(dr->d_name);
    }
    closedir(dir);
    for (int i = 0; i < tab.size(); i++) {
        if (tab[i].compare(0, 11, "lib_arcade_") == 0 && tab[i].compare(tab[i].size()-3, 3, ".so") == 0)
            this->tab_change_game.push_back("games/" + tab[i]);
    }
    Init_lib_graphical(nameLib);
}

void Core::Init_lib_graphical(const std::string &nameLib)
{
    this->_nameLib_graphical = nameLib;
    if ((this->handl_graph = dlopen(this->_nameLib_graphical.c_str(), RTLD_LAZY)) == NULL) {
        std::cerr << "Cannot open library: " << this->_nameLib_graphical << std::endl;
        exit(84);
    }
    if ((this->symdl_graph = dlsym(this->handl_graph, "Create")) == NULL) {
        std::cerr << "Cannot open function: Create in the lib " << this->_nameLib_graphical << std::endl;
        dlclose(this->handl_graph);
        exit(84);
    }
    this->pGraphical = (maker_graphicals)this->symdl_graph;
    this->IGraphicals = this->pGraphical();
    if (this->no_init_game == 1)
        Draw();
    else
        Init_lib_game(this->_nameLib_game);
}

void Core::Init_lib_game(const std::string &nameLib)
{
    this->_event = "STOP";
    this->_nameLib_game = nameLib;
    if ((this->handl_game = dlopen(this->_nameLib_game.c_str(), RTLD_LAZY)) == NULL) {
        std::cerr << "Cannot open library: " << this->_nameLib_game << dlerror() << std::endl;
        dlclose(this->handl_graph);
        exit(84);
    }
    if ((this->symdl_game = dlsym(this->handl_game, "Create")) == NULL) {
        std::cerr << "Cannot open function: Create in the lib " << this->_nameLib_game << std::endl;
        dlclose(this->handl_graph);
        dlclose(this->handl_game);
        exit(84);
    }
    this->pGame = (maker_game)this->symdl_game;
    this->IGame = this->pGame();
    Draw();
}

Core::~Core()
{
    this->IGraphicals->Destroy();
    this->IGame->Destroy();
    dlclose(this->handl_game);
    dlclose(this->handl_graph);
}

std::string Core::get_next_graph(std::string namelib)
{
    int i = 0;

    for (; i < this->tab_change_lib.size(); i++) {
        if (this->tab_change_lib[i] == namelib)
            break;
    }
    if (i == this->tab_change_lib.size() - 1)
        return (this->tab_change_lib[0]);
    return (this->tab_change_lib[i + 1]);
}

std::string Core::get_prev_graph(std::string namelib)
{
    int i = 0;

    for (; i < this->tab_change_lib.size(); i++) {
        if (this->tab_change_lib[i] == namelib)
            break;
    }
    if (i == 0)
        return (this->tab_change_lib[this->tab_change_lib.size() - 1]);
    return (this->tab_change_lib[i - 1]);
}

std::string Core::get_next_game(std::string namelib)
{
    int i = 0;

    for (; i < this->tab_change_game.size(); i++) {
        if (this->tab_change_game[i] == namelib)
            break;
    }
    if (i == this->tab_change_game.size() - 1)
        return (this->tab_change_game[0]);
    else if (i == this->tab_change_game.size())
        return (this->tab_change_game[0]);
    return (this->tab_change_game[i + 1]);
}

std::string Core::get_prev_game(std::string namelib)
{
    int i = 0;

    for (; i < this->tab_change_game.size(); i++) {
        if (this->tab_change_game[i] == namelib)
            break;
    }
    if (i == 0)
        return (this->tab_change_game[this->tab_change_game.size() - 1]);
    return (this->tab_change_game[i - 1]);
}

void Core::Event(int i)
{
    int z = 0;

    z = this->IGame->Event(&this->_event);
    if (z == 666) {
        this->IGame->Destroy();
        this->_event = "STOP";
        this->no_init_game = 0;
        this->_loose_game = this->_nameLib_game;
        dlclose(this->handl_game);
        Init_lib_game("games_base/lib_arcade_loose.so");
        return;
    }
    if (z == 555) {
        this->IGame->Destroy();
        this->_event = "STOP";
        this->no_init_game = 0;
        this->_loose_game = this->_nameLib_game;
        dlclose(this->handl_game);
        Init_lib_game("games_base/lib_arcade_win.so");
        return;
    }
    if (i == 1) {
        this->IGame->Destroy();
        this->no_init_game = 0;
        dlclose(this->handl_game);
        Init_lib_game("games/lib_arcade_nibbler.so");
        return;
    }
    if (i == 2) {
        this->IGraphicals->Destroy();
        this->no_init_game = 1;
        dlclose(this->handl_graph);
        Init_lib_graphical(get_next_graph(this->_nameLib_graphical));
        return;
    }
    if (i == 4) {
        this->IGraphicals->Destroy();
        this->no_init_game = 1;
        dlclose(this->handl_graph);
        Init_lib_graphical(get_prev_graph(this->_nameLib_graphical));
        return;
    }
    if (i == 5) {
        this->IGame->Destroy();
        this->no_init_game = 0;
        dlclose(this->handl_game);
        Init_lib_game(this->_loose_game);
        return;
    }
    if (i == 6) {
        this->IGame->Destroy();
        this->no_init_game = 0;
        dlclose(this->handl_game);
        Init_lib_game("games_base/lib_arcade_menu.so");
        return;
    }
    if (i == 7) {
        this->IGame->Destroy();
        this->no_init_game = 0;
        dlclose(this->handl_game);
        Init_lib_game("games/lib_arcade_pacman.so");
        return;
    }
    if (i == 8) {
        this->IGame->Destroy();
        this->no_init_game = 0;
        dlclose(this->handl_game);
        Init_lib_game(get_next_game(this->_nameLib_game));
        return;
    }
    if (i == 9) {
        this->IGame->Destroy();
        this->no_init_game = 0;
        dlclose(this->handl_game);
        Init_lib_game(get_prev_game(this->_nameLib_game));
        return;
    }
}

void Core::Draw()
{
    int i = 0;

    this->IGraphicals->Init();
    if (this->no_init_game == 0)
        this->IGame->Init();
    while (this->IGraphicals->WindowisOpen()) {
        i = this->IGraphicals->Event(&this->_event);
        Event(i);
        if (i == 3)
            break;
        this->IGraphicals->Draw(this->IGame->Draw());
    }
}