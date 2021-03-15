##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## libmy.a
##

SRC	=	src/sfml.cpp

OBJS	=	$(SRC:.cpp=.o)

NAME	=	lib_arcade_sfml.so

CPPFLAGS  =   -I./include

all: 		$(NAME)

$(NAME):	$(OBJS)
	g++ $(SRC) -fpic -shared -o $(NAME) -lsfml-graphics -lsfml-window -lsfml-system
	mv $(NAME) ../../lib/

clean:
	rm -f $(OBJS)

fclean:		clean
	rm -f ../../lib/$(NAME)

re:		clean fclean all
