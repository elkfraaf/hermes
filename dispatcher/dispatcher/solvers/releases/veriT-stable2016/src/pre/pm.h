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

/**
  \file pm.h
  \author David Deharbe

  \brief Pre-processing for axiom schemata instantiation

  \note A <em>parametric sort</em> is defined by its name and its arity.  The
    arity is the number of sorts that need to be given as actual
    parameters to the sort, e.g. <tt>(List 1)</tt> and <tt>(Pair 2)</tt>.

    A parametric sort may have <em>ground instances</em>,
    e.g. <tt>(List Int)</tt> and <tt>(Pair Real Int)</tt> and 
    <em>polymorphic instances</em>, e.g.  <tt>(List 's)</tt>, 
    <tt>(Pair 's 't)</tt>, <tt>(Pair 's 's)</tt>.

    Polymorphic instances only occur within the scope of a quantifier.
    Such a quantification is called an <em>axiom schema</em> and is used to
    give a semantics to the sort (or, rather, to its instances).

    The reasoning engine of veriT is first-order and all sorts need to
    be ground. The goal of pm_process is to instantiate axiom schemata
    for all ground instances. Each axiom schema is substituted by
    the conjunction of those ground instances in the original formula.

  \remarks This pre-processing is not correct w.r.t incrementality
  \remarks This module only removes quantifiers in top level conjunction
*/

#ifndef __PM_H
#define __PM_H

#include "DAG.h"

/**
   \brief instantiates axioms with symbols on parametric sorts
   
   \param src a DAG 

   \pre The following is expected of \c src \c

   - it is a conjunction

   - axiom schemata appear as arguments of the conjunction

   - axiom schemata are quantified formulas

   - the sort of the quantified variables is a sort variable or a
   parametric sort applied to a sort variable

   \return The DAG where all such axioms are replaced with a
   conjunction of universally quantified formulas. There is one
   such quantified formula for each possible combination of
   instantiation of a parametric sort in the original axiom.
   An instantiation of a parametric sort is the application of
   a sort substitution of polymorphic parametric sort occuring
   in the axiom with a non-polymorphic parametric sort occuring 
   in DAG.

   If there is no such instance, the schemata are replaced
   by TRUE.
*/
TDAG pm_process(TDAG src);

/**
   \brief array version of the pm_process function
   \remark Destructive
   \see pm_process
*/
void    pm_process_array(unsigned n, TDAG * Psrc);

#endif /* __PM_H */
