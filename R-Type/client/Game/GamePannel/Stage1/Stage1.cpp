/*
** EPITECH PROJECT, 2020
** stage1
** File description:
** cpp
*/

#include "Stage1.hpp"

Stage1::Stage1(std::vector<GameObject*> gameObject)
{
    this->_stage1 = gameObject;
    Init();
}

Stage1::~Stage1() {}

int Stage1::getPlayer()
{
    for (int i = 0; i < this->_stage1.size(); i++) {
        if (this->_stage1[i]->getPosition_Type() == PLAYER)
            return (i);
    }
    return (0);
}

void Stage1::Init()
{
    int x = 0;

    this->_stage1.push_back(new GameObject(910 - 250, 540 - 125, STAGETITLE1, 500, 250, SGAME, ButtonAction::NOTHING,{0,0}));
    for (int i = 0; i < 3; i++) {
        this->_stage1.push_back(new GameObject(2550 + x, 150 + (rand() % 600), ENNEMIE, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage1.push_back(new GameObject(2750 + x, 450 + (rand() % 400 - 400), ENNEMIE, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage1.push_back(new GameObject(2950 + x, 750 - (rand() % 600), ENNEMIE, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        x += 250;
    }
    this->_stage1.push_back(new GameObject(2000, 750, BOSS1, 102, 150, SGAME, ButtonAction::NOTHING, {0,0}));
    this->_stage1.push_back(new GameObject(-8000, 0, VIEBOSS, 1920, 35, SGAME, ButtonAction::NOTHING, {0,0}));
    this->_player = getPlayer();
    this->_tmp_dmgboss = 0;
}

int Stage1::getEnnemi()
{
    for (int i = 0; i < this->_stage1.size(); i++) {
        if (this->_stage1[i]->getPosition_Type() == ENNEMIE && this->_stage1[i]->getDead() == 0)
            return (0);
    }
    return (1);
}

//////////////////////////////ENNEMIE MOVE IA///////////////////////////////////

void Stage1::Event_dmg(int i)
{
    if (this->_stage1[i]->getPosition_x() <= this->_stage1[this->_player]->getPosition_x() + 30
    && this->_stage1[i]->getPosition_x() + 50 >= this->_stage1[this->_player]->getPosition_x()
    && this->_stage1[i]->getPosition_y() <= this->_stage1[this->_player]->getPosition_y() + 48
    && this->_stage1[i]->getPosition_y() + 50 >= this->_stage1[this->_player]->getPosition_y()) {
        this->_stage1[this->_player + this->_stage1[this->_player]->getHpPlayer()]->setPosition_x(10000);
        this->_stage1[this->_player]->setHpPlayer(this->_stage1[this->_player]->getHpPlayer() - 1);
        this->_stage1[i]->setDead(1);
    }
    if (this->_stage1[this->_player]->getHpPlayer() == 0)
        this->_stage1[this->_player]->setDead(1);
}

void Stage1::Event_ennemie(int i)
{
    if (this->_stage1[i]->getPosition_x() < 2000) {
        for (int a = 0; a < this->_stage1.size(); a++) {
            if (this->_stage1[a]->getPosition_Type() == STAGETITLE1)
                this->_stage1[a]->setPosition_y(EREASE);
        }
    }
    Event_dmg(i);
    if (this->_stage1[i]->getDead() == 1)
        this->_stage1[i]->setPosition_x(10000);
    if (this->_stage1[i]->getPosition_x() > 0) {
        this->_stage1[i]->setPosition_x(this->_stage1[i]->getPosition_x() - 4);
        if (this->_stage1[i]->getTmpEnnemi() == 0) {
            this->_stage1[i]->setPosition_y(this->_stage1[i]->getPosition_y() + 4);
            if (this->_stage1[i]->getPosition_y() >= 800)
                this->_stage1[i]->setTmpEnnemi(1);
        } else {
            this->_stage1[i]->setPosition_y(this->_stage1[i]->getPosition_y() - 4);
            if (this->_stage1[i]->getPosition_y() <= 100)
                this->_stage1[i]->setTmpEnnemi(0);
        }
    } else
        this->_stage1[i]->setPosition_x(this->_stage1[i]->getPosition_x() + 1930);
}

void Stage1::Event_dmgBoss(int i)
{
    if (this->_stage1[i]->getPosition_x() <= this->_stage1[this->_player]->getPosition_x() + 30
    && this->_stage1[i]->getPosition_x() + 102 >= this->_stage1[this->_player]->getPosition_x()
    && this->_stage1[i]->getPosition_y() <= this->_stage1[this->_player]->getPosition_y() + 48
    && this->_stage1[i]->getPosition_y() + 150 >= this->_stage1[this->_player]->getPosition_y()
    && this->_tmp_dmgboss == 0) {
        this->_stage1[this->_player + this->_stage1[this->_player]->getHpPlayer()]->setPosition_x(10000);
        this->_stage1[this->_player]->setHpPlayer(this->_stage1[this->_player]->getHpPlayer() - 1);
        this->_stage1[i]->setHp(this->_stage1[i]->getHp() - 96);
        this->_stage1[i + 1]->setSize_width(this->_stage1[i + 1]->getSize_width() - 96);
        if (this->_stage1[i]->getHp() < 4)
            this->_stage1[i]->setDead(1);
        this->_tmp_dmgboss = 1;
    } else if (this->_stage1[i]->getPosition_x() <= this->_stage1[this->_player]->getPosition_x() + 30
    && this->_stage1[i]->getPosition_x() + 102 >= this->_stage1[this->_player]->getPosition_x()
    && this->_stage1[i]->getPosition_y() <= this->_stage1[this->_player]->getPosition_y() + 48
    && this->_stage1[i]->getPosition_y() + 150 >= this->_stage1[this->_player]->getPosition_y())
        this->_tmp_dmgboss = 1;
    else
        this->_tmp_dmgboss = 0;
    if (this->_stage1[this->_player]->getHpPlayer() == 0)
        this->_stage1[this->_player]->setDead(1);
}

void Stage1::Event_boss1(int i)
{
    if (this->_stage1[i]->getPosition_x() > 1900)
        this->_stage1[i]->setPosition_x(this->_stage1[i]->getPosition_x() - 15);
    if (this->_stage1[i]->getDead() == 1) {
        this->_stage1[i]->setPosition_y(EREASE);
        this->_stage1[i + 1]->setPosition_y(EREASE);
    }
    Event_dmgBoss(i);
    if (this->_stage1[i]->getTmpEnnemi() == 0) {
        this->_stage1[i]->setPosition_x(this->_stage1[i]->getPosition_x() - 15);
        if ((this->_stage1[i]->getPosition_x() >= 700 && this->_stage1[i]->getPosition_x() <= 1300)
        && this->_stage1[i]->getPosition_y() >= 25)
            this->_stage1[i]->setPosition_y(this->_stage1[i]->getPosition_y() - 15);
        if (this->_stage1[i]->getPosition_x() < 102)
            this->_stage1[i]->setTmpEnnemi(1);
    } else if (this->_stage1[i]->getTmpEnnemi() == 1) {
        this->_stage1[i]->setPosition_y(this->_stage1[i]->getPosition_y() + 15);
        if (this->_stage1[i]->getPosition_y() >= 750)
            this->_stage1[i]->setTmpEnnemi(2);
    } else if (this->_stage1[i]->getTmpEnnemi() == 2) {
        this->_stage1[i]->setPosition_x(this->_stage1[i]->getPosition_x() + 15);
        if ((this->_stage1[i]->getPosition_x() >= 700 && this->_stage1[i]->getPosition_x() <= 1300)
        && this->_stage1[i]->getPosition_y() >= 25)
            this->_stage1[i]->setPosition_y(this->_stage1[i]->getPosition_y() - 15);
        if (this->_stage1[i]->getPosition_x() > 1780)
            this->_stage1[i]->setTmpEnnemi(3);
    } else if (this->_stage1[i]->getTmpEnnemi() == 3) {
        this->_stage1[i]->setPosition_y(this->_stage1[i]->getPosition_y() + 15);
        if (this->_stage1[i]->getPosition_y() >= 750)
            this->_stage1[i]->setTmpEnnemi(0);
    }
}

void Stage1::Event(int i, std::vector<GameObject*> gameObject)
{
    this->_stage1.clear();
    this->_stage1 = gameObject;
    if (this->_stage1[i]->getPosition_Type() == ENNEMIE)
        this->Event_ennemie(i);
    if (this->_stage1[i]->getPosition_Type() == BOSS1 && getEnnemi() == 1) {
        this->_stage1[i + 1]->setPosition_x(0);
        this->Event_boss1(i);
    }
}

std::vector<GameObject*> Stage1::getTab()
{
    return (this->_stage1);
}