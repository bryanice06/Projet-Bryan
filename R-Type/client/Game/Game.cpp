/*
** EPITECH PROJECT, 2020
** game
** File description:
** cpp
*/

#include "Game.hpp"

Game::Game(std::vector<std::string> tab)
{
    Init(tab);
}

void Game::Init(std::vector<std::string> player)
{
    int x = 0;

    this->numberOfShoot = 0;
    this->currenNumberOfShoot = 0;
    this->_stage = 0;
    this->tmp_stage = 0;
    this->_gameObject.push_back(new GameObject(0, 0, BACKGROUNDGAME1, 1920, 1080, SGAME, ButtonAction::NOTHING, {0,0}));
    this->_gameObject.push_back(new GameObject(500, 500, PLAYER, 30, 48, SGAME, ButtonAction::NOTHING, {0,0}));
    for (int i = 0; i < 3; i++) {
        this->_gameObject.push_back(new GameObject(500 + x, 500 - 12, VIEPLAYER, 10, 9, SGAME, ButtonAction::NOTHING, {0, 0}));
        x += 11;
    }
    this->move = NONE;
}

///////////////////////////////////EVENT////////////////////////////////////////

int Game::nextStage()
{
    for (int i = 0; i < this->_gameObject.size(); i ++) {
        if (this->_gameObject[i]->getPosition_Type() == PLAYER && this->_gameObject[i]->getHpPlayer() <= 0) {
            this->tmp_stage = 8;
            return (4);
        }
        if (this->tmp_stage == 1) {
            if (this->_gameObject[i]->getPosition_Type() == BOSS1 && this->_gameObject[i]->getDead() == 0)
                return (this->_stage);
            else if (this->_gameObject[i]->getPosition_Type() == BOSS1 && this->_gameObject[i]->getDead() == 1) {
                this->_gameObject[i]->setPosition_y(EREASE);
                this->_gameObject[i + 1]->setPosition_y(EREASE);
            }
        } else if (this->tmp_stage == 3) {
            if (this->_gameObject[i]->getPosition_Type() == BOSS2 && this->_gameObject[i]->getDead() == 0)
                return (this->_stage);
            else if (this->_gameObject[i]->getPosition_Type() == BOSS2 && this->_gameObject[i]->getDead() == 1) {
                this->_gameObject[i]->setPosition_y(EREASE);
                this->_gameObject[i + 1]->setPosition_y(EREASE);
                this->_gameObject[i - 1]->setPosition_x(this->_gameObject[i]->getPosition_x() + 220);
                this->_gameObject[i - 1]->setPosition_y(this->_gameObject[i]->getPosition_y() + 200 - 21);
                this->_gameObject[i - 2]->setPosition_x(this->_gameObject[i]->getPosition_x() + 220);
                this->_gameObject[i - 2]->setPosition_y(this->_gameObject[i]->getPosition_y() + 100);
                this->_gameObject[i - 3]->setPosition_x(this->_gameObject[i]->getPosition_x() + 220);
                this->_gameObject[i - 3]->setPosition_y(this->_gameObject[i]->getPosition_y() + 280 - 14);
            }
        } else if (this->tmp_stage == 5) {
            if (this->_gameObject[i]->getPosition_Type() == BOSS3 && this->_gameObject[i]->getDead() == 0)
                return (this->_stage);
            else if (this->_gameObject[i]->getPosition_Type() == BOSS3 && this->_gameObject[i]->getDead() == 1) {
                this->_gameObject[i]->setPosition_y(EREASE);
                this->_gameObject[i + 1]->setPosition_y(EREASE);
            }
        }
    }
    this->tmp_stage += 1;
    return (this->_stage + 1);
}

void Game::getStage()
{
    if (this->tmp_stage != 0 && this->tmp_stage < 6)
        this->_stage = nextStage();
////    Stage 1
    if (this->_stage == 0 && this->tmp_stage == 0) {
        this->Istage = StageFactory::CreateNewStageFactory(StageFactory::StageType::STAGE1, this->_gameObject);
        this->_gameObject.clear();
        this->_gameObject = this->Istage->getTab();
        this->tmp_stage = 1;
    }
/////   Stage 2
    if (this->_stage == 1 && this->tmp_stage == 2) {
        this->_gameObject[0] = new GameObject(0, 0, BACKGROUNDGAME2, 1920, 1080, SGAME, ButtonAction::NOTHING, {0,0});
//        std::for_each( this->_gameObject.begin() + 2, this->_gameObject.end(), deletePointerElement<GameObject*>() );
        this->Istage = StageFactory::CreateNewStageFactory(StageFactory::StageType::STAGE2, this->_gameObject);
        this->_gameObject.clear();
        this->_gameObject = this->Istage->getTab();
        this->tmp_stage = 3;
    }
/////   Stage 3
    if (this->_stage == 2 && this->tmp_stage == 4) {
//        std::for_each( this->_gameObject.begin() + 2, this->_gameObject.end(), deletePointerElement<GameObject*>() );
        this->Istage = StageFactory::CreateNewStageFactory(StageFactory::StageType::STAGE3, this->_gameObject);
        this->_gameObject.clear();
        this->_gameObject = this->Istage->getTab();
        this->tmp_stage = 5;
    }
/////   Win
    if (this->_stage == 3 && this->tmp_stage ==6) {
//        std::for_each( this->_gameObject.begin(), this->_gameObject.end(), deletePointerElement<GameObject*>() );
        this->Istage = StageFactory::CreateNewStageFactory(StageFactory::StageType::WIN, this->_gameObject);
        this->_gameObject.clear();
        this->_gameObject = this->Istage->getTab();
        this->tmp_stage = 7;
    }
/////   Loose
    if (this->_stage == 4 && this->tmp_stage == 8) {
//        std::for_each( this->_gameObject.begin(), this->_gameObject.end(), deletePointerElement<GameObject*>() );
        this->Istage = StageFactory::CreateNewStageFactory(StageFactory::StageType::LOOSE, this->_gameObject);
        this->_gameObject.clear();
        this->_gameObject = this->Istage->getTab();
        this->tmp_stage = 9;
    }
}

void Game::Event(int event)
{
    getStage();
    for (int i = 0; i < this->_gameObject.size(); i++) {
        if (this->_gameObject[i]->getPosition_Type() == PLAYER)
            this->Event_Move(i, event);
        if (this->_gameObject[i]->getPosition_Type() == LASERS)
            this->Event_shootMove(i);
        if (this->_gameObject[i]->getPosition_Type() == BACKGROUNDGAME1)
            this->Event_parallaxe(i, 1920);
        if (this->_gameObject[i]->getPosition_Type() == BACKGROUNDGAME2)
            this->Event_parallaxe(i, 3840);
        if (this->_gameObject[i]->getPosition_Type() == BACKGROUNDGAME3)
            this->Event_parallaxe(i, 1920);

        this->Istage->Event(i, this->_gameObject);
        this->_gameObject.clear();
        this->_gameObject = this->Istage->getTab();
    }

}

///////////////////////////////////PARALLAXE////////////////////////////////////

void Game::Event_parallaxe(int i, const int size)
{
    if (this->_gameObject[i]->getRectLeft() < size) {
        this->_gameObject[i]->setRectLeft(this->_gameObject[i]->getRect().rectLeft + 8);
    } else {
        this->_gameObject[i]->setRectLeft(0);
    }
}

//////////////////////////////////PLAYER SHOOT//////////////////////////////////

void Game::Event_shootMove(int i)
{
    if (this->_gameObject[i]->getPosition_x() > 1920) {
        this->_gameObject[i]->setPosition_y(EREASE);
        this->currenNumberOfShoot--;
        this->numberOfShoot--;
    }
    for (int a = 0; a < this->_gameObject.size(); a++) {
        if ((this->_gameObject[a]->getPosition_Type() == ENNEMIE || this->_gameObject[a]->getPosition_Type() == ENNEMIE2 || this->_gameObject[a]->getPosition_Type() == ENNEMIE3)
        && this->_gameObject[i]->getPosition_x() >= this->_gameObject[a]->getPosition_x()
        && this->_gameObject[i]->getPosition_x() <= (this->_gameObject[a]->getPosition_x() + 50)
        && this->_gameObject[i]->getPosition_y() >= this->_gameObject[a]->getPosition_y()
        && this->_gameObject[i]->getPosition_y() <= (this->_gameObject[a]->getPosition_y() + 50)) {
            this->_gameObject[a]->setDead(1);
            this->_gameObject[i]->setPosition_y(EREASE);
            this->currenNumberOfShoot--;
            this->numberOfShoot--;
        }
        if (this->_gameObject[a]->getPosition_Type() == BOSS1
        && this->_gameObject[i]->getPosition_x() >= this->_gameObject[a]->getPosition_x()
        && this->_gameObject[i]->getPosition_x() <= (this->_gameObject[a]->getPosition_x() + 102)
        && this->_gameObject[i]->getPosition_y() >= this->_gameObject[a]->getPosition_y()
        && this->_gameObject[i]->getPosition_y() <= (this->_gameObject[a]->getPosition_y() + 150)) {
            this->_gameObject[a]->setHp(this->_gameObject[a]->getHp() - _DEGAT);
            this->_gameObject[a + 1]->setSize_width(this->_gameObject[a + 1]->getSize_width() - _DEGAT);
            if (this->_gameObject[a]->getHp() < 4)
                this->_gameObject[a]->setDead(1);
            this->_gameObject[i]->setPosition_y(EREASE);
            this->currenNumberOfShoot--;
            this->numberOfShoot--;
        }
        if (this->_gameObject[a]->getPosition_Type() == BOSS2
        && this->_gameObject[i]->getPosition_x() >= this->_gameObject[a]->getPosition_x()
        && this->_gameObject[i]->getPosition_x() <= (this->_gameObject[a]->getPosition_x() + 480)
        && this->_gameObject[i]->getPosition_y() >= this->_gameObject[a]->getPosition_y()
        && this->_gameObject[i]->getPosition_y() <= (this->_gameObject[a]->getPosition_y() + 400)) {
            this->_gameObject[a]->setHp(this->_gameObject[a]->getHp() - (_DEGAT - 60));
            this->_gameObject[a + 1]->setSize_width(this->_gameObject[a + 1]->getSize_width() - (_DEGAT - 60));
            if (this->_gameObject[a]->getHp() < 4)
                this->_gameObject[a]->setDead(1);
            this->_gameObject[i]->setPosition_y(EREASE);
            this->currenNumberOfShoot--;
            this->numberOfShoot--;
        }
        if (this->_gameObject[a]->getPosition_Type() == BOSS3
        && this->_gameObject[i]->getPosition_x() >= this->_gameObject[a]->getPosition_x()
        && this->_gameObject[i]->getPosition_x() <= (this->_gameObject[a]->getPosition_x() + 480)
        && this->_gameObject[i]->getPosition_y() >= this->_gameObject[a]->getPosition_y()
        && this->_gameObject[i]->getPosition_y() <= (this->_gameObject[a]->getPosition_y() + 266)) {
            this->_gameObject[a]->setHp(this->_gameObject[a]->getHp() - (_DEGAT - 70));
            this->_gameObject[a + 1]->setSize_width(this->_gameObject[a + 1]->getSize_width() - (_DEGAT - 70));
            if (this->_gameObject[a]->getHp() < 4)
                this->_gameObject[a]->setDead(1);
            this->_gameObject[i]->setPosition_y(EREASE);
            this->currenNumberOfShoot--;
            this->numberOfShoot--;
        }
    }
    this->_gameObject[i]->setPosition_x(this->_gameObject[i]->getPosition_x() + _SPEEDSHOOT);
    if (this->_gameObject[i]->getRectLeft() < 275)
        this->_gameObject[i]->setRectLeft(this->_gameObject[i]->getRect().rectLeft + 13);
    else
        this->_gameObject[i]->setRectLeft(210);
}

void Game::Event_shoot(int i)
{
    if (this->currenNumberOfShoot < this->numberOfShoot) {
        this->_gameObject.push_back(
            new GameObject(
                this->_gameObject[i]->getPosition_x() + 15,
                this->_gameObject[i]->getPosition_y() + 23,
                LASERS,
                13,
                13,
                SGAME,
                ButtonAction::NOTHING,
                {210, 278}
            )
        );
        this->currenNumberOfShoot++;
    }
}

////////////////////////////////PLAYER MOVE/////////////////////////////////////

void Game::Event_Move(int i, int event)
{
    int x = 0;

    event = (Move)event ? (Move)event : 0;
    if (event == SHOOT && this->numberOfShoot < 5) {
        this->numberOfShoot++;
        this->Event_shoot(i);
    }
    if (event == DOWN || this->move == DOWN)
        Event_down(i);
    if (event == UP|| this->move == UP)
        Event_up(i);
    if (event == LEFT|| this->move == LEFT)
        Event_left(i);
    if (event == RIGHT|| this->move == RIGHT)
        Event_right(i);
    if ( this->move == DOWN)
        Event_down(i);
    if (this->move == UP)
        Event_up(i);
    if (this->move == LEFT)
        Event_left(i);
    if (this->move == RIGHT)
        Event_right(i);
    for (int a = 1; a <= this->_gameObject[i]->getHpPlayer(); a++) {
        this->_gameObject[i + a]->setPosition_x(this->_gameObject[i]->getPosition_x() + x);
        this->_gameObject[i + a]->setPosition_y(this->_gameObject[i]->getPosition_y() - 12);
        x += 11;
    }
}

void Game::Event_up(int i)
{
    this->moveAnnexe = this->move;
    this->move = UP;
    this->_gameObject[i]->setPosition_y(this->_gameObject[i]->getPosition_y() - _SPEEDPLAYER);
}

void Game::Event_down(int i)
{
    this->moveAnnexe = this->move;
    this->move = DOWN;
    if (this->moveAnnexe == DOWN || this->moveAnnexe == UP) {
        this->_gameObject[i]->setPosition_y(this->_gameObject[i]->getPosition_y() + _SPEEDPLAYER);

    }else if (this->moveAnnexe == LEFT) {
        this->_gameObject[i]->setPosition_y(this->_gameObject[i]->getPosition_y() + _SPEEDPLAYER);
        this->_gameObject[i]->setPosition_x(this->_gameObject[i]->getPosition_x() - _SPEEDPLAYER);

    } else {
        this->_gameObject[i]->setPosition_y(this->_gameObject[i]->getPosition_y() + _SPEEDPLAYER);
        this->_gameObject[i]->setPosition_x(this->_gameObject[i]->getPosition_x() + _SPEEDPLAYER);

    }
}

void Game::Event_right(int i)
{
    this->move = RIGHT;
    this->_gameObject[i]->setPosition_x(this->_gameObject[i]->getPosition_x() + _SPEEDPLAYER);
}

void Game::Event_left(int i)
{
    this->move = LEFT;
    this->_gameObject[i]->setPosition_x(this->_gameObject[i]->getPosition_x() - _SPEEDPLAYER);
}

std::vector<GameObject*> Game::Draw()
{
    return (this->_gameObject);
}