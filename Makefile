# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbauer <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/21 18:44:49 by bbauer            #+#    #+#              #
#    Updated: 2017/05/06 12:38:07 by bmerrill         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ft_printf.a
CC = gcc
LIBFT = ./libft/libft.a
CFLAGS = -Wall -Wextra -Werror
DEBUGFLAGS =  -fsanitize=address -g -o ft_printf_debug
LEAKCHECKFLAGS = -g -o ft_printf_leakcheck
SRCF =	appends.c		\
		apply_space.c	\
		cast_length.c	\
		flag_handling.c	\
		ft_printf.c		\
		parse_flags.c	\
		print_c.c		\
		print_d.c		\
		print_mod.c		\
		print_o.c		\
		print_p.c		\
		print_s.c		\
		print_u.c		\
		print_xxu.c		\

SRC = $(addprefix $(SRCDIR),$(SRCF))
OBJ = $(addprefix $(OBJDIR),$(SRCF:.c=.o))

OBJDIR = ./obj/
SRCDIR = ./src/
LIBDIR = ./libft/
INCDIR = ./include/

.PHONY: all, clean, fclean, re

all: $(LIBFT) $(NAME)

$(NAME): $(LIBFT)
	@echo "Compiling ft_printf"
	@$(CC) $(CFLAGS) -c -I$(INCDIR) $(SRC)
	@ar rc $(NAME) $(OJB) $(LIBFT) $(FLAGS)
	@mkdir -p $(OBJDIR)
	@mv $(SRCF:.c=.o) $(OBJDIR)
	@echo "ft_printf: SUCCESS!"

$(LIBFT):
	@make -C $(LIBDIR) all

clean:
	@echo "Cleaning ft_printf"
	@rm -rf $(OBJDIR)
	@rm -rf ft_printf_debug
	@rm -rf ft_printf_debug.dSYM
	@rm -rf ft_printf_leakcheck
	@rm -rf ft_printf_leakcheck.dSYM
	@make -C $(LIBDIR) clean

fclean: clean
	@echo "FCleaning ft_printf"
	@rm -rf $(NAME)
	@make -C $(LIBDIR) fclean

re: fclean all

debug: $(LIBFT)
	@echo "Compiling ft_printf with debugging options"
	$(CC) $(SRC) ./tests/$(TEST) $(LIBFT) -I$(INCDIR) $(DEBUGFLAGS)

leakcheck: $(LIBFT)
	@echo "Compiling ft_printf for leak checks with valgrind"
	$(CC) $(SRC) ./tests/$(TEST) $(LIBFT) -I$(INCDIR) $(LEAKCHECKFLAGS)
