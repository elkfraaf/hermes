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

/*
  --------------------------------------------------------------
  Module for removing ite functions in formulas
  --------------------------------------------------------------
*/

#ifndef BFUN_ELIM_H
#define BFUN_ELIM_H

#include "DAG.h"

/**
   \author Pascal Fontaine
   computes an equisatisfiable formula such that no function
   except ite and Boolean connectors have boolean arguments (bfun)
   Also eliminates quantifications on boolean variables (in a naïve way)
   \param DAG the formula with bfuns
   \return The bfun-free equisatisfiable formula
   \remarks Non destructive
   \remarks DAG-linear
   \remarks Works with bfun within quantifiers, but may introduce ite
   \remarks Does not like lambdas and let */
TDAG      bfun_elim(TDAG DAG);

/**
   \brief array version of the bfun_elim function
   \remark Destructive
   \see bfun_elim */
void      bfun_elim_array(unsigned n, TDAG * Psrc);

#endif