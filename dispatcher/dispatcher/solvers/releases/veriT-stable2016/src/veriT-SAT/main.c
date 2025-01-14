/*
Copyright (c) 2009-2013, INRIA, Universite de Nancy 2 and Universidade
Federal do Rio Grande do Norte.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   * Neither the name of the Universite de Nancy 2 or the Universidade Federal
     do Rio Grande do Norte nor the names of its contributors may be used
     to endorse or promote products derived from this software without
     specific prior written permission.

THIS SOFTWARE IS PROVIDED BY INRIA, Universite de Nancy 2 and
Universidade Federal do Rio Grande do Norte ''AS IS'' AND ANY EXPRESS
OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL INRIA, Université de Nancy 2 and
Universidade Federal do Rio Grande do Norte BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

*/

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "veriT-SAT.h"

/*--------------------------------------------------------------*/

#define MY_MALLOC(v,s) \
  v = malloc(s); \
  if (s && !v) \
    my_error ("malloc error on line %d in file " __FILE__ "\n", __LINE__)
#define MY_REALLOC(v,s) \
  v = realloc(v,s); \
  if (s && !v) \
    my_error ("realloc error on line %d in file " __FILE__ "\n", __LINE__)

static void
my_error (char *format, ...)
{
  va_list params;
  va_start (params, format);
  fprintf (stderr, "error : ");
  vfprintf (stderr, format, params);
  va_end (params);
  exit (1);
}

/*
  --------------------------------------------------------------
  parser
  --------------------------------------------------------------
*/

#define BUFFER_SIZE 1<<18

unsigned buffer_p = 0;
unsigned buffer_size = 0;
char buffer[BUFFER_SIZE];
unsigned eof = 0;
FILE * file = NULL;

/*--------------------------------------------------------------*/

static void
init(void)
{
  buffer_size = (unsigned) fread(buffer, 1, BUFFER_SIZE, file);
  buffer_p = 0;
  if (buffer_size < BUFFER_SIZE)
    {
      eof = 1;
      buffer[buffer_size++] = 0;
    }
}

/*--------------------------------------------------------------*/

static void
fill(void)
{
  if (eof)
    {
      buffer_p--;
      return;
    }
  buffer_size = (unsigned) fread(buffer, 1, BUFFER_SIZE, file);
  buffer_p = 0;
  if (buffer_size < BUFFER_SIZE)
    {
      eof = 1;
      buffer[buffer_size++] = 0;
    }
}

/*--------------------------------------------------------------*/

static void
next(void)
{
  buffer_p++;
  if (buffer_p == buffer_size)
    fill();
}

/*--------------------------------------------------------------*/

static char
current(void)
{
  return buffer[buffer_p];
}

/*--------------------------------------------------------------*/

static void
eat_spaces(void)
{
  while (current() &&
	 (current() == ' ' || current() == 9)) next();
}

/*--------------------------------------------------------------*/

static SAT_Tlit
parse_lit(void)
{
  unsigned sign = 1;
  unsigned var = 0;
  if (current() == '-')
    {
      sign = 0;
      next();
    }
  if (current() == '+')
    next();
  while (current() >= '0' && current() <= '9')
    {
      var = var * 10 + (unsigned) (current() - '0');
      next();
    }
  SAT_var_new_id(var);
  return SAT_lit(var, sign);
}

/*--------------------------------------------------------------*/

__attribute__((noinline))
static void
parse(char * filename)
{
  unsigned n = 0;
  unsigned size = 32;
  SAT_Tlit * lit = NULL, tmp;
  file = fopen(filename, "r");
  if (!file)
    return;
  init();
  MY_MALLOC(lit, size * sizeof(SAT_Tlit));
  while (current())
    {
      eat_spaces();
      if (current() == 'c' || current() == 'p')
	{
	  next();
	  while (current() && current() != '\n') next();
	  next();
	  continue;
	}
      if (current() == '\n' || current() == 10)
	{
	  next();
	  continue;
	}
      if (current() < '0' &&
	  current() > '9' &&
	  current() != '-' &&
	  current() != '+')
	my_error("parsing error\n");
      if (n == size)
	{
	  size <<= 1;
	  MY_REALLOC(lit, size * sizeof(SAT_Tlit));
	}
      tmp = parse_lit();
      if (tmp == 1)
	{
	  SAT_Tlit * cpy;
	  MY_MALLOC(cpy, n * sizeof(SAT_Tlit));
	  memcpy(cpy, lit, n * sizeof(SAT_Tlit));
	  SAT_clause_new(n, cpy , SAT_CLAUSE_EXT);
	  n = 0;
	}
      else
	lit[n++] = tmp;
    }
  free(lit);
  fclose(file);
}

/*
  --------------------------------------------------------------
  main
  --------------------------------------------------------------
*/

int
main (int argc, char ** argv)
{
  unsigned result;
  char * filename;
  if (argc != 2)
    my_error ("wrong arguments\n");
  filename = argv[1];
  SAT_init();
  parse(filename);
  result = SAT_solve ();
  if (result)
    {
      unsigned i;
#ifdef PRINT_MIN_MODEL
      SAT_Tlit * Plit = NULL;
      unsigned n;
#endif
      printf ("s SATISFIABLE\n");
      printf ("v ");
      for (i = 0; i < SAT_literal_stack_n; i++)
	if (SAT_lit_pol(SAT_literal_stack[i]))
	  printf("%d ", SAT_lit_var(SAT_literal_stack[i]));
	else
	  printf("-%d ", SAT_lit_var(SAT_literal_stack[i]));
      printf ("\n");
#ifdef PRINT_MIN_MODEL
      SAT_minimal_model(&Plit, &n);
      printf ("v ");
      for (i = 0; i < n; i++)
	if (SAT_lit_pol(Plit[i]))
	  printf("%d ", SAT_lit_var(Plit[i]));
	else
	  printf("-%d ", SAT_lit_var(Plit[i]));
      printf ("\n");
      printf("STAT: SAT_model_size=%d\n", SAT_literal_stack_n);
      printf("STAT: SAT_minimal_model_size=%d\n", n);
      free(Plit);
#endif
      SAT_done ();
      return 10;
    }
  else
    {
      printf ("s UNSATISFIABLE\n");
      SAT_done ();
      return 20;
    }
  SAT_done ();
  return 0;
}
