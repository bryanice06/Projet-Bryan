##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## libmy.a
##

SRC	=	src/ncurse.cpp

OBJS	=	$(SRC:.cpp=.o)

NAME	=	lib_arcade_ncurse.so

CPPFLAGS  =   -I./include

all: 		$(NAME)

$(NAME):	$(OBJS)
	g++ $(SRC) -fpic -shared -o $(NAME) -lncurses
	mv $(NAME) ../../lib/

clean:
	rm -f $(OBJS)

fclean:		clean
	rm -f ../../lib/$(NAME)

re:		clean fclean all
