/*
** EPITECH PROJECT, 2020
** 
** File description:
** 
*/

#include "server.hpp"

int main(int ac, char **av)
{
    try
    {
        boost::asio::io_service io_service;
        udp_server server(io_service);
        io_service.run();
    }
    catch (std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }

    return 0;
}