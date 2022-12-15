/*
** EPITECH PROJECT, 2020
** game
** File description:
** hpp
*/

#ifndef _GAME_HPP_
#define _GAME_HPP_

#include "IScreenView.hpp"

#include "GamePannel/IStage.hpp"
#include "GamePannel/StageFactory.hpp"

#define _SPEEDPLAYER 5
#define _SPEEDSHOOT 30
#define _DEGAT 100
#include <algorithm>

template< typename T >
struct deletePointerElement
{
    void operator()( T element ) const
    {
        delete element;
    }
};
class Game: public IScreenView {
public:
    Game(std::vector<std::string>);
    virtual void Init(std::vector<std::string>);
    virtual void Event(int);
    virtual std::vector<GameObject*> Draw();
    int nextStage();
    void getStage();
    //////////////
    ////EVENT/////
    //////////////
    void Event_parallaxe(int, const int);
    void DeleteAllElement();

    ///event Shoot
    void Event_shoot(int);
    void Event_shootMove(int);
    ///event Player
    void Event_Move(int, int );
    void Event_up(int);
    void Event_down(int);
    void Event_right(int);
    void Event_left(int);
    ///event ennemie
    void Event_ennemie(int);
    void Event_boss1(int);

private:
    std::vector<GameObject*> _gameObject;
    Move move;
    Move moveAnnexe;
    int numberOfShoot;
    int currenNumberOfShoot;
    std::vector<int> time;
    IStage *Istage;
    int _stage;
    int tmp_stage;

};

#endif