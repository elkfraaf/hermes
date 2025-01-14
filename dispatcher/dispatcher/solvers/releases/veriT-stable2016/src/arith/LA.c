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

#include <limits.h>

#include "options.h"

#include "LA.h"
#include "LA-hw.h"
#include "LA-mp.h"
#include "eq-store.h"
#include "totality.h"

static void (*LA_done_aux)(void) = NULL;

void (*LA_notify_formula)(TDAG DAG) = NULL;

void (*LA_unate_propagation)(void) = NULL;

Tstatus  (*LA_assert)(Tlit lit) = NULL;

Tstatus  (*LA_assert_eq)(TDAG DAG1, TDAG DAG2) = NULL;

Tstatus  (*LA_assert_neq)(TDAG DAG1, TDAG DAG2) = NULL;

Tstatus  (*LA_solve_r)(void) = NULL;

Tstatus  (*LA_solve_z)(void) = NULL;

void     (*LA_simp)(void) = NULL;

void     (*LA_conflict)(void) = NULL;
#if PROOF
Tproof   (*LA_conflict_proof)(void) = NULL;
#endif

void     (*LA_conflict_z)(void) = NULL;
#if PROOF
Tproof   (*LA_conflict_proof_z)(void) = NULL;
#endif

void     (*LA_repair)(void) = NULL;

bool (*LA_model_eq)(void) = NULL;

void (*LA_hint_explain)(Tlit)
= NULL;

unsigned svar_to_var_size = 0;
Tvar * svar_to_var = NULL;

static Tstack_DAG notified_formulas = NULL;

/* #define DEBUG_EXCEPTION_OVERFLOW */

/*--------------------------------------------------------------*/

/**
   \addtogroup arguments_developer

   - --enable-lemmas-totality

   Enables the generation of lemmas encoding totality property. */
bool LA_enable_lemmas_totality;

/*--------------------------------------------------------------*/

/**
   \addtogroup arguments_developer

   - --disable-simp-const

   Disable silent elimination of constant variables in simplex. */
bool LA_disable_simp_const;

/*--------------------------------------------------------------*/

/**
   \addtogroup arguments_developer

   - --disable-hw-int

   Disable use of hardware integers in simplex. */
bool LA_disable_hw_int;

/*--------------------------------------------------------------*/

/**
   \addtogroup arguments_developer

   - --enable-lemmas-bounds

   Enables the generation of lemmas encoding consequences between arithmetic
   bounds. */
bool LA_enable_lemmas;

/*--------------------------------------------------------------*/

/**
   \addtogroup arguments_developer

   - --enable-arith-theory-propagation

   Enables the generation of hints from the arithmetics to the SAT
   solver. */
bool LA_enable_theory_propagation;

/*--------------------------------------------------------------*/

/**
   \addtogroup arguments_developer

   - --disable-vsh

   Disables branch-and-bound variable selection heuristics. */
bool LA_disable_bbvsh;

/*--------------------------------------------------------------*/

/**
   \author Pascal Fontaine
   \brief wrapper around LA_hw_notify_formula to remember which
   formulas to notify again if switch to mp */
static void
LA_notify_formula_aux(TDAG DAG)
{
  stack_push(notified_formulas, DAG);
  LA_hw_notify_formula(DAG);
}

/*--------------------------------------------------------------*/

void LA_dummy_simp(void);
void
LA_dummy_simp(void)
{
  return;
}

/*--------------------------------------------------------------*/

void
LA_init(void)
{
  eq_init();
  totality_init();
  if (LLONG_MAX / INT_MAX < INT_MAX)
    my_error("incompatible native integer types");
  LA_done_aux = LA_hw_done;
  LA_notify_formula = LA_notify_formula_aux;
  LA_unate_propagation = LA_hw_unate_propagation;
  LA_assert = LA_hw_assert;
  LA_assert_eq = LA_hw_assert_eq;
  LA_assert_neq = LA_hw_assert_neq;
  LA_model_eq = LA_hw_model_eq;
  LA_solve_r = LA_hw_solve_r;
  LA_solve_z = LA_hw_solve_z;
  LA_simp = LA_hw_simp;
  LA_repair = LA_hw_repair;
  LA_conflict = LA_hw_conflict;
  LA_conflict_z = LA_hw_conflict_z;
#if PROOF
  LA_conflict_proof = LA_hw_conflict_proof;
  LA_conflict_proof_z = LA_hw_conflict_proof_z;
#endif
  LA_hint_explain = LA_hw_hint_explain;
  LA_hw_init();
  stack_INIT(notified_formulas);
  options_new(0, "disable-simp-const",
              "Disable silent elimination of constant variables in simplex.",
              &LA_disable_simp_const);
  options_new(0, "disable-hw-int",
              "Disable use of hardware integers for simplex.",
              &LA_disable_hw_int);
  options_new(0, "enable-lemmas-totality",
              "Generates lemmas based on the totality property.",
              &LA_enable_lemmas_totality);
  options_new(0, "enable-arith-theory-propagation",
              "Arithmetic creates hints for the SAT solver.",
              &LA_enable_theory_propagation);
  options_new(0, "enable-lemmas-bounds",
              "Generates lemmas involving literals on arithmetic bounds.",
              &LA_enable_lemmas);
  options_new(0, "disable-bb-var-selection",
              "Disables branch-and-bound variable selection heuristics.",
              &LA_disable_bbvsh);
}

/*--------------------------------------------------------------*/

void
LA_set(void)
{
  if (LA_disable_hw_int)
    {
      LA_overflow = true;
      LA_switch_to_mp();
    }
  if (LA_disable_simp_const)
    LA_simp = LA_dummy_simp;
}

/*--------------------------------------------------------------*/

void
LA_done(void)
{
  LA_done_aux();
  stack_free(notified_formulas);
  eq_done();
  totality_done();
}

/*--------------------------------------------------------------*/

void
LA_switch_to_mp(void)
{
  unsigned i;
#ifdef DEBUG_EXCEPTION_OVERFLOW
  fprintf(stderr, "Changing to GMP\n");
#endif
  assert(LA_done_aux == LA_hw_done);
  assert(LA_overflow);
  LA_hw_done();
  eq_reset_var();
  LA_overflow = false;
  LA_done_aux = LA_mp_done;
  LA_notify_formula = LA_mp_notify_formula;
  LA_unate_propagation = LA_mp_unate_propagation;
  LA_assert = LA_mp_assert;
  LA_assert_eq = LA_mp_assert_eq;
  LA_assert_neq = LA_mp_assert_neq;
  LA_model_eq = LA_mp_model_eq;
  LA_solve_r = LA_mp_solve_r;
  LA_solve_z = LA_mp_solve_z;
  LA_simp = LA_mp_simp;
  if (LA_disable_simp_const)
    LA_simp = LA_dummy_simp;
  LA_repair = LA_mp_repair;
  LA_conflict = LA_mp_conflict;
  LA_conflict_z = LA_mp_conflict_z;
#if PROOF
  LA_conflict_proof = LA_mp_conflict_proof;
  LA_conflict_proof_z = LA_mp_conflict_proof_z;
#endif
  LA_mp_init();
  for (i = 0; i < stack_size(notified_formulas); i++)
    LA_notify_formula(stack_get(notified_formulas, i));
  if (LA_enable_lemmas)
    LA_unate_propagation();
  LA_hint_explain = LA_mp_hint_explain;
}
