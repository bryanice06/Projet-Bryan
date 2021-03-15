/*
** EPITECH PROJECT, 2020
** Ncurse
** File description:
** cpp
*/

#include "../include/ncurse.hpp"

void Ncurse::Init()
{
    this->_usec = 120000;
    this->_score = 0;
    this->_color = 6;
    initscr();
    cbreak();
    noecho();
    start_color();
    init_pair(1, COLOR_RED, COLOR_RED);
    init_pair(2, COLOR_BLUE, COLOR_BLUE);
    init_pair(3, COLOR_WHITE, COLOR_WHITE);
    init_pair(4, COLOR_CYAN, COLOR_CYAN);
    init_pair(5, COLOR_MAGENTA, COLOR_CYAN);
    init_pair(6, COLOR_YELLOW, COLOR_YELLOW);
    init_pair(7, COLOR_CYAN, COLOR_CYAN);
    init_pair(8, COLOR_RED, COLOR_RED);
    init_pair(9, COLOR_BLUE, COLOR_BLUE);
    init_pair(10, COLOR_YELLOW, COLOR_YELLOW);
    init_pair(11, COLOR_CYAN, COLOR_CYAN);
    init_pair(12, COLOR_MAGENTA, COLOR_MAGENTA);
    init_pair(13, COLOR_MAGENTA, COLOR_MAGENTA);
    init_pair(14, COLOR_MAGENTA, COLOR_MAGENTA);
    init_pair(15, COLOR_MAGENTA, COLOR_MAGENTA);
    keypad(stdscr, TRUE);
    curs_set(FALSE);
    nodelay(stdscr, true);
}

void Ncurse::Draw(const std::vector<std::string> draw)
{
    int z = 0;
    int score = this->_score;
    int color = 4;
    int color_ghost = 8;

    if (draw.size() == 24) {
        this->_score = std::atoi(draw[1].c_str());
        if (this->_score > score) this->_usec -= 1000;
        if (this->_score % 2 == 0) color = 1;
    }
    if (draw.back() == "FOOD")
        color_ghost = 12;
    for (int i = 0; i < draw.size(); i++) {
        for (int y = 0; y < draw[i].size(); y++) {
            if (draw[i][y] == 'q' || draw[i][y] == '!') {
                attron(COLOR_PAIR(color));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(color));
            } else if (draw[i][y] == '/') {
                attron(COLOR_PAIR(6));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(6));
            }  else if (draw[i][y] == 'W') {
                attron(COLOR_PAIR(1));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(6));
            } else if (draw[i][y] == ']') {
                attron(COLOR_PAIR(2));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(2));
            } else if (draw[i][y] == '*') {
                attron(COLOR_PAIR(3));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(3));
            } else if (draw[i][y] == '_') {
                attron(COLOR_PAIR(6));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(6));
            } else if (draw[i][y] == '+') {
                attron(COLOR_PAIR(color_ghost));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(color_ghost));
            } else if (draw[i][y] == '-') {
                attron(COLOR_PAIR(color_ghost + 1));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(color_ghost + 1));
            } else if (draw[i][y] == ';') {
                attron(COLOR_PAIR(color_ghost + 2));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(color_ghost + 2));
            } else if (draw[i][y] == '?') {
                attron(COLOR_PAIR(color_ghost + 3));
                mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
                attroff(COLOR_PAIR(color_ghost + 3));
            } else mvprintw(z, (COLS / 2) - (draw[i].size() / 2) + y, "%c", draw[i][y]);
        }
        z++;
    }
    refresh();
}

int Ncurse::Event(std::string *event)
{
    int key = 0;

    clear();
    usleep(this->_usec);
    key = getch();
    if (key == 'n') return (1);
    if (key == 'z') return (2);
    if (key == 'q') return (3);
    if (key == 'a') return (4);
    if (key == 'r') return (5);
    if (key == 'm') return (6);
    if (key == 'p') return (7);
    if (key == 'w') return (8);
    if (key == 'x') return (9);
    if (key == KEY_UP) *event = "UP";
    if (key == KEY_RIGHT) *event = "RIGHT";
    if (key == KEY_LEFT) *event = "LEFT";
    if (key == KEY_DOWN) *event = "DOWN";
    return (0);
}

bool Ncurse::WindowisOpen()
{
    return true;
}

void Ncurse::Destroy()
{
    endwin();
}