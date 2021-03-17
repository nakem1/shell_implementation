/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lmurray <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/10/30 01:45:23 by lmurray           #+#    #+#             */
/*   Updated: 2020/11/02 06:54:49 by lmurray          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

/*
** Function:		char *ft_strdup
**
** Description:		The ft_strdup() function allocates sufficient memory for a
** copy of thestring s1, does the copy, and returns a pointer to it.
** The pointer may subsequently be used as an argument to the function free(3).
*/

char	*ft_strdup(const char *s)
{
	char	*dest;
	int		i;
	int		n;

	i = 0;
	n = ft_strlen(s);
	if (!(dest = (char *)malloc((n * sizeof(char)) + 1)))
		return (NULL);
	while (i < n)
	{
		dest[i] = s[i];
		i++;
	}
	dest[n] = '\0';
	return (dest);
}
