##
## EPITECH PROJECT, 2020
## Makefile
## File description:
## Arcade
##

SRC	=	main.cpp		\
		Core/src/core.cpp	\

OBJS	=	$(SRC:.cpp=.o)

NAME	=	arcade

CPPFLAGS  =   -I./include

all:		$(NAME)

$(NAME):	$(OBJS)
	make -C ./Graphicals
	make -C ./Games
	g++ -o $(NAME) $(OBJS) -ldl

core:		$(OBJS)
	make base -C ./Games
	g++ -o $(NAME) $(OBJS) -ldl

games:		$(OBJS)
	make -C ./Games

graphicals:		$(OBJS)
	make -C ./Graphicals

clean:
	make clean -C ./Graphicals
	make clean -C ./Games
	rm -f $(OBJS)

fclean:		clean
	make fclean -C ./Graphicals
	make fclean -C ./Games
	rm -f $(NAME)

re:		fclean all
