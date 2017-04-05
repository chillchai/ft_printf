/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: exam <marvin@42.fr>                        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/04/04 09:08:01 by exam              #+#    #+#             */
/*   Updated: 2017/04/05 16:09:06 by bmerrill         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int get_conv_size(int value, int base)
{
	int i;

	i = 0;
	if (value == 0)
	{
		i++;
		return(i);
	}
	while(value)
	{
		value /= base;
		i++;
	}
	return(i);
}

char	*ft_itoa_base(unsigned int value, int base)
{
	int size;
	char *ret;
	char *conv = "0123456789ABCDEF";
/* 	get the size */
	size = get_conv_size(value, base);
/* 	malloc */
	ret = (char*)malloc(sizeof(char) * (size + 1));
/* 	convert to base */
	while(size >= 0)
	{
		ret[--size] = conv[value % base];
		value /= base;
	}
	return(ret);
}
