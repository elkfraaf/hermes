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

#ifndef __H_UTIL_H
#define __H_UTIL_H

#define HASH_MACRO

/**
   \author Pascal Fontaine
   \brief general purpose hash function for strings
   \param str a string to get a hash for
   \return hash key for string */
unsigned  hash_one_at_a_time(char * str);

/**
   \author Pascal Fontaine
   \brief general purpose hash function for unsigned
   \param u an unsigned to get a hash for
   \return hash key for unsigned */
unsigned  hash_one_at_a_time_u(unsigned u);

/**
   \author Pascal Fontaine
   \brief incremental general purpose hash function for string
   \param str a string to get a hash for
   \return hash key for unsigned and previous hash
   \remark use with hash = 0 at first, and finalise with _end function below */
unsigned  hash_one_at_a_time_inc(unsigned hash, char * str);

/**
   \author Pascal Fontaine
   \brief incremental general purpose hash function for unsigned
   \param u an unsigned to get a hash for
   \return hash key for unsigned and previous hash
   \remark use with hash = 0 at first, and finalise with _end function below */
#ifdef HASH_MACRO
#define hash_one_at_a_time_u_inc(hash, u)	\
  ((((hash) + (u)) << 10) ^ (((hash) + (u)) >> 6))
#else
unsigned hash_one_at_a_time_u_inc(unsigned hash, unsigned u);
#endif

/**
   \author Pascal Fontaine
   \brief finalise hash key
   \param hash a hash key
   \return hash key finalised */
unsigned hash_one_at_a_time_inc_end(unsigned hash);

#endif /* __H_UTIL_H */
