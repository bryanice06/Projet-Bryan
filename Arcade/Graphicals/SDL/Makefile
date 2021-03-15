##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## libmy.a
##

SRC	=	src/sdl.cpp

OBJS	=	$(SRC:.cpp=.o)

NAME	=	lib_arcade_SDL.so

CPPFLAGS  =   -I./include

all: 		$(NAME)

$(NAME):	$(OBJS)
	g++ $(SRC) -fpic -shared -o $(NAME) -lSDL2 -lSDL2_image -lSDL2_ttf

	mv $(NAME) ../../lib/

clean:
	rm -f $(OBJS)

fclean:		clean
	rm -f ../../lib/$(NAME)

re:		clean fclean all
