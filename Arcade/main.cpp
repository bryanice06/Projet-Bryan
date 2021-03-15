/*
** EPITECH PROJECT, 2020
** main
** File description:
** main
*/

#include "Core/include/core.hpp"

int main(int ac, char **av)
{
    Core *display = NULL;

    if (ac == 2) {
        display = new Core(av[1]);
        delete (display);
    } else {
        std::cerr << "error argument" << std::endl;
        return (84);
    }
    return (0);
}