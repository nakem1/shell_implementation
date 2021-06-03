# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: frariel <frariel@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/03 21:29:25 by frariel           #+#    #+#              #
#    Updated: 2021/06/04 00:34:02 by frariel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

CC = gcc

FN_NAMES_RIN =	rinshell/built_in.c \
				rinshell/cleaners.c \
				rinshell/conver_envlist_to_array.c \
				rinshell/convert_envp.c \
				rinshell/echo.c \
				rinshell/env_var_handlers.c \
				rinshell/execute_programs.c \
				rinshell/exit_handler.c \
				rinshell/export.c \
				rinshell/increase_shlvl.c \
				rinshell/main_logic.c \
				rinshell/pwd_cd.c \
				rinshell/set_and_prepare_fds.c \
				rinshell/sort_list.c \
				rinshell/unset.c \
				src/main/handle_errors.c \
				src/main/main.c \
				src/main/termcaps.c \
				src/main/prompt.c \
				src/main/history.c \
				src/parse/free_memory.c \
				src/parse/handle_shielding.c \
				src/parse/line_division_utils.c \
				src/parse/line_division.c \
				src/parse/parse_utils.c \
				src/parse/parse.c \
				src/parse/parse_norm.c \
				src/parse/redir_pipe_norm.c \
				src/parse/redir_pipe.c

FN_NAMES_O= $(FN_NAMES:.c=.o)

HEADERS = ./headers

all: $(NAME)

$(NAME): $(FN_NAMES)
		cd ./src/libft && make && mv libft.a ../../ && make clean && cd ../.. && \
		gcc -Wall -Wextra -Werror -o minishell -I ./headers -I ./rinshell \
		./src/parse/*.c ./src/main/*.c ./src/libft/*.c ./rinshell/*.c -ltermcap libft.a

clean:
		/bin/rm -f $(FN_NAMES_O)

fclean: clean
		/bin/rm -f $(NAME) libft.a

re: fclean all
		$(CC) $(FN_NAMES_O) -I ./headers libft.a -o $(NAME)
