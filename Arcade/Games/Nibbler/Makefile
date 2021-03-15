##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## libmy.a
##

SRC	=	src/nibbler.cpp

OBJS	=	$(SRC:.cpp=.o)

NAME	=	lib_arcade_nibbler.so

CPPFLAGS  =   -I./include

all: 		$(NAME)

$(NAME):	$(OBJS)
	g++ $(SRC) -fpic -shared -o $(NAME)
	mv $(NAME) ../../games/

clean:
	rm -f $(OBJS)

fclean:		clean
	rm -f ../../games/$(NAME)

re:		clean fclean all
