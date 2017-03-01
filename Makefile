# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdeclerc <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/02/06 17:11:00 by fdeclerc          #+#    #+#              #
#    Updated: 2017/03/01 16:00:24 by fdeclerc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = wolf3d

LFT = libft/libft.a

MLX = minilibx

LIBS = $(LFT) -L

HPATH = -I./

SRC = wolf.c \
	  draw.c \
	  init.c \
	  keyboard.c

CC = gcc -g -Wall -Werror -Wextra

C_MLX = $(MLX) -lmlx -framework OpenGL -framework AppKit

AR = ar - cvq libft.a

RM = rm -rf

SRCDIR = $(addprefix ./src/, $(SRC))

OBJDIR = obj

OBJ = $(addprefix ./$(OBJDIR)/, $(SRC:.c=.o))

$(NAME):
	@make -C libft
	@$(CC) -c $(SRCDIR)
	@mkdir -p $(OBJDIR) && mv $(SRC:.c=.o) ./$(OBJDIR)/
	@$(CC) -o $(NAME) $(OBJ) $(LIBS) $(C_MLX) $(HPATH)

all: $(NAME)

clean:
	@$(RM) $(OBJDIR)
	@make clean -C libft

fclean: clean
	@make fclean -C libft
	@$(RM) $(NAME)

re: fclean
	@make re -C libft
	@make all
	@make clean

.PHONY: all clean fclean
