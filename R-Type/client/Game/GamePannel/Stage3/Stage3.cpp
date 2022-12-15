/*
** EPITECH PROJECT, 2020
** Stage3
** File description:
** cpp
*/

#include "Stage3.hpp"

Stage3::Stage3(std::vector<GameObject*> gameObject)
{
    this->_stage3 = gameObject;
    Init();
}

Stage3::~Stage3() {}

int Stage3::getPlayer()
{
    for (int i = 0; i < this->_stage3.size(); i++) {
        if (this->_stage3[i]->getPosition_Type() == PLAYER)
            return (i);
    }
    return (0);
}

void Stage3::Init()
{
    int x = 0;

    this->_special_boss = 0;
    this->_tmp_shoot_boss = 1;
    this->_stage3.push_back(new GameObject(910 - 250, 540 - 125, STAGETITLE3, 500, 250, SGAME, ButtonAction::NOTHING,{0,0}));
    for (int i = 0; i < 3; i++) {
        this->_stage3.push_back(new GameObject(2550 + x, 150 + (rand() % 600), ENNEMIE, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(2750 + x, 450 + (rand() % 400 - 400), ENNEMIE, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(2950 + x, 750 - (rand() % 600), ENNEMIE, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        x += 250;
    }
    x = 0;
    for (int i = 0; i < 3; i++) {
        this->_stage3.push_back(new GameObject(2700 + x, 150 + (rand() % 600), ENNEMIE2, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(2900, 800, LASERSENNEMI, 16, 12, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(2900 + x, 450 + (rand() % 400 - 400), ENNEMIE2, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(2900, 800, LASERSENNEMI, 16, 12, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(3100 + x, 750 - (rand() % 600), ENNEMIE2, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(2900, 800, LASERSENNEMI, 16, 12, SGAME, ButtonAction::NOTHING, {0, 0}));
        x += 250;
    }
    x = 0;
    for (int i = 0; i < 3; i++) {
        this->_stage3.push_back(new GameObject(2850 + x, 150 + (rand() % 600), ENNEMIE3, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(2900, 800, LASERSENNEMI3, 16, 12, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(3050 + x, 450 + (rand() % 400 - 400), ENNEMIE3, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(2900, 800, LASERSENNEMI3, 16, 12, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(3250 + x, 750 - (rand() % 600), ENNEMIE3, 50, 50, SGAME, ButtonAction::NOTHING, {0, 0}));
        this->_stage3.push_back(new GameObject(2900, 800, LASERSENNEMI3, 16, 12, SGAME, ButtonAction::NOTHING, {0, 0}));
        x += 250;
    }
    this->_stage3.push_back(new GameObject(2900, 800, LASERSBOSS, 32, 29, SGAME, ButtonAction::NOTHING, {0, 0}));
    this->_stage3.push_back(new GameObject(2900, 800, LASERSBOSS, 32, 29, SGAME, ButtonAction::NOTHING, {0, 0}));
    this->_stage3.push_back(new GameObject(2900, 800, SPECIALBOSS, 52, 42, SGAME, ButtonAction::NOTHING, {0, 0}));
    this->_stage3.push_back(new GameObject(2000, 540 - 240, BOSS3, 480, 266, SGAME, ButtonAction::NOTHING, {0,0}));
    this->_stage3.push_back(new GameObject(-8000, 0, VIEBOSS, 1920, 35, SGAME, ButtonAction::NOTHING, {0,0}));
    this->_player = getPlayer();
}

int Stage3::getEnnemi()
{
    for (int i = 0; i < this->_stage3.size(); i++) {
        if (this->_stage3[i]->getPosition_Type() == ENNEMIE && this->_stage3[i]->getDead() == 0
        || this->_stage3[i]->getPosition_Type() == ENNEMIE2 && this->_stage3[i]->getDead() == 0
        || this->_stage3[i]->getPosition_Type() == ENNEMIE3 && this->_stage3[i]->getDead() == 0)
            return (0);
    }
    return (1);
}
//////////////////////////////ENNEMIE MOVE IA///////////////////////////////////

void Stage3::Event_dmg(int i)
{
    if (this->_stage3[i]->getPosition_x() <= this->_stage3[this->_player]->getPosition_x() + 30
        && this->_stage3[i]->getPosition_x() + 50 >= this->_stage3[this->_player]->getPosition_x()
        && this->_stage3[i]->getPosition_y() <= this->_stage3[this->_player]->getPosition_y() + 48
        && this->_stage3[i]->getPosition_y() + 50 >= this->_stage3[this->_player]->getPosition_y()) {
        this->_stage3[this->_player + this->_stage3[this->_player]->getHpPlayer()]->setPosition_x(10000);
        this->_stage3[this->_player]->setHpPlayer(this->_stage3[this->_player]->getHpPlayer() - 1);
        this->_stage3[i]->setDead(1);
    }
    if (this->_stage3[this->_player]->getHpPlayer() == 0)
        this->_stage3[this->_player]->setDead(1);
}

void Stage3::Event_ennemie(int i)
{
    if (this->_stage3[i]->getPosition_x() < 2000) {
        for (int a = 0; a < this->_stage3.size(); a++) {
            if (this->_stage3[a]->getPosition_Type() == STAGETITLE3)
                this->_stage3[a]->setPosition_y(EREASE);
        }
    }
    Event_dmg(i);
    if (this->_stage3[i]->getDead() == 1)
        this->_stage3[i]->setPosition_x(10000);
    if (this->_stage3[i]->getPosition_x() > 0) {
        this->_stage3[i]->setPosition_x(this->_stage3[i]->getPosition_x() - 4);
        if (this->_stage3[i]->getTmpEnnemi() == 0) {
            this->_stage3[i]->setPosition_y(this->_stage3[i]->getPosition_y() + 4);
            if (this->_stage3[i]->getPosition_y() >= 800)
                this->_stage3[i]->setTmpEnnemi(1);
        } else {
            this->_stage3[i]->setPosition_y(this->_stage3[i]->getPosition_y() - 4);
            if (this->_stage3[i]->getPosition_y() <= 100)
                this->_stage3[i]->setTmpEnnemi(0);
        }
    } else
        this->_stage3[i]->setPosition_x(this->_stage3[i]->getPosition_x() + 1930);
}

void Stage3::shoot_move(int i)
{
    if (this->_stage3[i + 1]->getPosition_x() < - 15) {
        this->_stage3[i + 1]->setShoot(0);
        this->_stage3[i + 1]->setPosition_x(this->_stage3[i]->getPosition_x() + 25);
        this->_stage3[i + 1]->setPosition_y(this->_stage3[i]->getPosition_y() + 25);
    } else if (this->_stage3[i + 1]->getPosition_x() <= (this->_stage3[this->_player]->getPosition_x() + 30)
    && this->_stage3[i + 1]->getPosition_x() >= this->_stage3[this->_player]->getPosition_x()
    && this->_stage3[i + 1]->getPosition_y() <= (this->_stage3[this->_player]->getPosition_y() + 48)
    && this->_stage3[i + 1]->getPosition_y() >= this->_stage3[this->_player]->getPosition_y()) {
        this->_stage3[i + 1]->setShoot(0);
        this->_stage3[i + 1]->setPosition_x(this->_stage3[i]->getPosition_x() + 25);
        this->_stage3[i + 1]->setPosition_y(this->_stage3[i]->getPosition_y() + 25);
        this->_stage3[this->_player + this->_stage3[this->_player]->getHpPlayer()]->setPosition_x(10000);
        this->_stage3[this->_player]->setHpPlayer(this->_stage3[this->_player]->getHpPlayer() - 1);
    } else
        this->_stage3[i + 1]->setPosition_x(this->_stage3[i + 1]->getPosition_x() - 30);
}

void Stage3::rand_shoot(int i)
{
    if (this->_stage3[i + 1]->getShoot() == 0 && this->_stage3[i]->getPosition_x() < 1920)
        this->_stage3[i + 1]->setShoot(1);
}

void Stage3::Event_ennemie2(int i)
{
    Event_dmg(i);
    if (this->_stage3[i]->getDead() == 1)
        this->_stage3[i]->setPosition_x(10000);
    if (this->_stage3[i]->getPosition_x() > 0) {
        this->_stage3[i]->setPosition_x(this->_stage3[i]->getPosition_x() - 4);
        if (this->_stage3[i]->getTmpEnnemi() == 0) {
            this->_stage3[i]->setPosition_y(this->_stage3[i]->getPosition_y() + 4);
            if (this->_stage3[i]->getPosition_y() >= 800)
                this->_stage3[i]->setTmpEnnemi(1);
        } else {
            this->_stage3[i]->setPosition_y(this->_stage3[i]->getPosition_y() - 4);
            if (this->_stage3[i]->getPosition_y() <= 100)
                this->_stage3[i]->setTmpEnnemi(0);
        }
    } else
        this->_stage3[i]->setPosition_x(this->_stage3[i]->getPosition_x() + 1930);
    rand_shoot(i);
    if (this->_stage3[i + 1]->getShoot() == 1)
        shoot_move(i);
    else {
        this->_stage3[i + 1]->setPosition_x(this->_stage3[i]->getPosition_x() + 25);
        this->_stage3[i + 1]->setPosition_y(this->_stage3[i]->getPosition_y() + 25);
    }
}

void Stage3::Event_ennemie3(int i)
{
    Event_dmg(i);
    if (this->_stage3[i]->getDead() == 1)
        this->_stage3[i]->setPosition_x(10000);
    if (this->_stage3[i]->getPosition_x() > 0)
        this->_stage3[i]->setPosition_x(this->_stage3[i]->getPosition_x() - 4);
    else
        this->_stage3[i]->setPosition_x(this->_stage3[i]->getPosition_x() + 1930);
    rand_shoot(i);
    if (this->_stage3[i + 1]->getShoot() == 1)
        shoot_move(i);
    else {
        this->_stage3[i + 1]->setPosition_x(this->_stage3[i]->getPosition_x() + 31);
        this->_stage3[i + 1]->setPosition_y(this->_stage3[i]->getPosition_y() + 22);
    }
}

void Stage3::rand_shootboss(int i)
{
    if (this->_stage3[i]->getShoot() == 0 && this->_stage3[i]->getPosition_x() <= 1050)
        this->_stage3[i]->setShoot(1);
}

void Stage3::shootboss_move(int i)
{
    if (this->_stage3[i - 2]->getPosition_x() < - 15) {
        this->_stage3[i - 2]->setShoot(0);
        this->_stage3[i - 2]->setPosition_x(this->_stage3[i]->getPosition_x() + 220);
        this->_stage3[i - 3]->setShoot(0);
        this->_stage3[i - 3]->setPosition_x(this->_stage3[i]->getPosition_x() + 220);
        this->_special_boss += 1;
    } else if ((this->_stage3[i - 2]->getPosition_x() <= (this->_stage3[this->_player]->getPosition_x() + 30)
    && this->_stage3[i - 2]->getPosition_x() >= this->_stage3[this->_player]->getPosition_x()
    && this->_stage3[i - 2]->getPosition_y() <= (this->_stage3[this->_player]->getPosition_y() + 48)
    && this->_stage3[i - 2]->getPosition_y() + 29 >= this->_stage3[this->_player]->getPosition_y())
    || (this->_stage3[i - 3]->getPosition_x() <= (this->_stage3[this->_player]->getPosition_x() + 30)
    && this->_stage3[i - 3]->getPosition_x() >= this->_stage3[this->_player]->getPosition_x()
    && this->_stage3[i - 3]->getPosition_y() <= (this->_stage3[this->_player]->getPosition_y() + 48)
    && this->_stage3[i - 3]->getPosition_y() + 29 >= this->_stage3[this->_player]->getPosition_y())) {
        this->_stage3[i - 2]->setShoot(0);
        this->_stage3[i - 2]->setPosition_x(this->_stage3[i]->getPosition_x() + 220);
        this->_stage3[i - 3]->setShoot(0);
        this->_stage3[i - 3]->setPosition_x(this->_stage3[i ]->getPosition_x() + 220);
        this->_special_boss += 1;
        this->_stage3[this->_player + this->_stage3[this->_player]->getHpPlayer()]->setPosition_x(10000);
        this->_stage3[this->_player]->setHpPlayer(this->_stage3[this->_player]->getHpPlayer() - 1);
    } else {
        this->_stage3[i - 2]->setPosition_x(this->_stage3[i - 2]->getPosition_x() - 30);
        this->_stage3[i - 3]->setPosition_x(this->_stage3[i - 3]->getPosition_x() - 30);
    }
    if (this->_stage3[i - 1]->getPosition_x() < - 50) {
        this->_stage3[i - 1]->setPosition_x(this->_stage3[i]->getPosition_x() + 220);
        this->_special_boss = 0;
    } else if (this->_stage3[i - 1]->getPosition_x() <= (this->_stage3[this->_player]->getPosition_x() + 30)
    && this->_stage3[i - 1]->getPosition_x() >= this->_stage3[this->_player]->getPosition_x()
    && this->_stage3[i - 1]->getPosition_y() <= (this->_stage3[this->_player]->getPosition_y() + 48)
    && this->_stage3[i - 1]->getPosition_y() + 42 >= this->_stage3[this->_player]->getPosition_y()) {
        this->_stage3[i - 1]->setPosition_x(this->_stage3[i]->getPosition_x() + 220);
        this->_special_boss = 0;
        this->_stage3[this->_player + this->_stage3[this->_player]->getHpPlayer()]->setPosition_x(10000);
        this->_stage3[this->_player]->setHpPlayer(this->_stage3[this->_player]->getHpPlayer() - 1);
    } else if (this->_special_boss >= 3)
        this->_stage3[i - 1]->setPosition_x(this->_stage3[i - 1]->getPosition_x() - 30);
}

void Stage3::Event_boss3(int i)
{
    if (this->_stage3[i]->getPosition_x() > 1050)
        this->_stage3[i]->setPosition_x(this->_stage3[i]->getPosition_x() - 10);
    if (this->_stage3[i]->getDead() == 1) {
        this->_stage3[i]->setPosition_y(EREASE);
        this->_stage3[i + 1]->setPosition_y(EREASE);
    }
    rand_shootboss(i);
    if (this->_stage3[i]->getShoot() == 1)
        shootboss_move(i);
    else {
        this->_stage3[i - 1]->setPosition_x(this->_stage3[i]->getPosition_x() + 220);
        this->_stage3[i - 1]->setPosition_y(this->_stage3[i]->getPosition_y() + 133 - 21);
        this->_stage3[i - 2]->setPosition_x(this->_stage3[i]->getPosition_x() + 220);
        this->_stage3[i - 2]->setPosition_y(this->_stage3[i]->getPosition_y() + 70);
        this->_stage3[i - 3]->setPosition_x(this->_stage3[i]->getPosition_x() + 220);
        this->_stage3[i - 3]->setPosition_y(this->_stage3[i]->getPosition_y() + 220 - 14);
    }
}

void Stage3::Event(int i, std::vector<GameObject*> gameObject)
{
    this->_stage3.clear();
    this->_stage3 = gameObject;
    if (this->_stage3[i]->getPosition_Type() == ENNEMIE)
        this->Event_ennemie(i);
    if (this->_stage3[i]->getPosition_Type() == ENNEMIE2)
        this->Event_ennemie2(i);
    if (this->_stage3[i]->getPosition_Type() == ENNEMIE3)
        this->Event_ennemie3(i);
    if (this->_stage3[i]->getPosition_Type() == BOSS3 && getEnnemi() == 1) {
        this->_stage3[i + 1]->setPosition_x(0);
        this->Event_boss3(i);
    }
}

std::vector<GameObject*> Stage3::getTab()
{
    return (this->_stage3);
}