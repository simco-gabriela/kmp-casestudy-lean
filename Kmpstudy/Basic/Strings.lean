import Mathlib.Data.List.Basic
import Mathlib.Tactic

namespace KMP

abbrev Text (α : Type) := List α
abbrev Pattern (α : Type) := List α

variable {α : Type}

def MatchesAt (t : Text α) (p : Pattern α) (i : Nat) : Prop :=
  p <+: t.drop i

def Occurs (t : Text α) (p : Pattern α) : Prop :=
  ∃ i, MatchesAt t p i

lemma matchesAt_zero (t : Text α) (p : Pattern α) :
  MatchesAt t p 0 ↔ p <+: t := by
  rfl

lemma empty_matches (t : Text α) (i : Nat) :
  MatchesAt t ([] : Pattern α) i := by
  simp [MatchesAt]  --List.nil_prefix

lemma matches_implies_occurs (t : Text α) (p : Pattern α) (i : Nat) :
  MatchesAt t p i → Occurs t p := by
  intro h
  exact ⟨i, h⟩
