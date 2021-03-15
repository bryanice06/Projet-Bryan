##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## libmy.a
##

SRC	=	src/loose.cpp

OBJS	=	$(SRC:.cpp=.o)

NAME	=	lib_arcade_loose.so

CPPFLAGS  =   -I./include

all: 		$(NAME)

$(NAME):	$(OBJS)
	g++ $(SRC) -fpic -shared -o $(NAME)
	mv $(NAME) ../../games_base/

clean:
	rm -f $(OBJS)

fclean:		clean
	rm -f ../../games_base/$(NAME)

re:		clean fclean all
