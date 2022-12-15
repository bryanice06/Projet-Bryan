/*
** EPITECH PROJECT, 2020
** 
** File description:
** 
*/

#include "server.hpp"

udp_server::udp_server(boost::asio::io_service &io_service) : socket_(io_service, udp::endpoint(udp::v4(), 6666))
{
    start_receive();
}

void udp_server::start_receive()
{
    std::cout << "mesage: " << std::endl;

    socket_.async_receive_from(
            boost::asio::buffer(recv_buffer_), remote_endpoint_,
            boost::bind(&udp_server::handle_receive, this,
                        boost::asio::placeholders::error,
                        boost::asio::placeholders::bytes_transferred));
}

void udp_server::handle_receive(const boost::system::error_code& error, std::size_t)
{
    if (!error || error == boost::asio::error::message_size)
    {
        std::cout << "mesage: " << std::endl;

        boost::shared_ptr<std::string> message(
                new std::string("yo tout le\n")
        );

        socket_.async_send_to(boost::asio::buffer(*message), remote_endpoint_,
                              boost::bind(&udp_server::handle_send, this, message,
                                          boost::asio::placeholders::error,
                                          boost::asio::placeholders::bytes_transferred));

        start_receive();
    }
    std::cout << "mesage: " << std::endl;

}
void udp_server::handle_send(boost::shared_ptr<std::string> message/*message*/,
                 const boost::system::error_code& /*error*/,
                 std::size_t /*bytes_transferred*/)
{
    std::cout << "mesage: " << message << std::endl;

}