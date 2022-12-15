//
// Created by tjeanningros on 31/10/2020.
//

#ifndef R_TYPE_ASSET_HPP
#define R_TYPE_ASSET_HPP

#define _BACKGROUND "client/Game/img/yourname.png"
#define _BACKGROUNDGAME1 "client/Game/img/space.png"
#define _BACKGROUNDGAME2 "client/Game/img/sky.jpg"
#define _BACKGROUNDGAME3 "client/Game/img/matrix.jpg"
#define _PLAYER "client/Game/img/player.png"
#define _ENNEMIE "client/Game/img/r-typesheet14.gif"
#define _ENNEMIE2 "client/Game/img/r-typesheet9.gif"
#define _ENNEMIE3 "client/Game/img/ennemi3.png"
#define _BUTTON "client/Game/img/PlayButton_1.png"
#define _BUTTONMENU "client/Game/img/button_menu.png"
#define _BUTTONPLAY "client/Game/img/button_play.png"
#define _BUTTONRESTART "client/Game/img/button_restart.png"
#define _BUTTONCREDIT "client/Game/img/button_credit.png"
#define _MENUTITLE "client/Game/img/Menu.png"
#define _STAGETITLE1 "client/Game/img/Stage1.png"
#define _STAGETITLE2 "client/Game/img/Stage2.png"
#define _STAGETITLE3 "client/Game/img/Stage3.png"
#define _WINTITLE "client/Game/img/Win.png"
#define _LOOSETITLE "client/Game/img/Loose.png"
#define _SETTINGSTITLE "client/Game/img/Settings.png"
#define _BOSS1 "client/Game/img/boss1.png"
#define _BOSS2 "client/Game/img/boss2.png"
#define _BOSS3 "client/Game/img/boss3.png"
#define _VIEBOSS "client/Game/img/vieboss1.png"
#define _LASERS "client/Game/img/lasers.gif"
#define _LASERSENNEMI "client/Game/img/lasersennemi.png"
#define _LASERSENNEMI3 "client/Game/img/lasersennemi3.png"
#define _LASERSBOSS "client/Game/img/lasersboss.png"
#define _SPECIALBOSS "client/Game/img/specialboss.png"
#define _VIEPLAYER "client/Game/img/coeur.png"
#define _BACKGROUNDWIN "client/Game/img/win_b.jpg"
#define _BACKGROUNDLOOSE "client/Game/img/loose_b.jpg"
#define _BACKGROUNDMENU "client/Game/img/menu_b.jpg"
#define _BACKGROUNDCREDIT "client/Game/img/credit_b.jpg"

struct Asset {
    std::vector<std::string> TypePath{
            _PLAYER,
            _VIEPLAYER,
            _LASERSENNEMI,
            _LASERSENNEMI3,
            _LASERSBOSS,
            _SPECIALBOSS,
            _ENNEMIE,
            _ENNEMIE2,
            _ENNEMIE3,
            _BACKGROUND,
            _BUTTON,
            _MENUTITLE,
            _STAGETITLE1,
            _STAGETITLE2,
            _STAGETITLE3,
            _WINTITLE,
            _LOOSETITLE,
            _SETTINGSTITLE,
            _BOSS1,
            _BOSS2,
            _BOSS3,
            _VIEBOSS,
            _LASERS,
            _BACKGROUNDGAME1,
            _BACKGROUNDGAME2,
            _BACKGROUNDGAME3,
            _BACKGROUNDWIN,
            _BACKGROUNDLOOSE,
            _BACKGROUNDMENU,
            _BACKGROUNDCREDIT,
            _BUTTONMENU,
            _BUTTONRESTART,
            _BUTTONPLAY,
            _BUTTONCREDIT,
    };
};

#endif //R_TYPE_ASSET_HPP
