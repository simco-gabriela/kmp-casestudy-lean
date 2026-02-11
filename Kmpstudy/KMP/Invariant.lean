import Kmpstudy.Basic.Strings
import Kmpstudy.Basic.PrefixSuffix
import Kmpstudy.KMP.Algorithm
import Mathlib.Data.List.Basic

namespace KMP


def Invariant {α : Type} (t : Text α) (p : Pattern α) (s : State) : Prop :=
  s.j ≤ p.length ∧
  s.i ≥ s.j ∧
  MatchesAt (α := α) t (p.take s.j) (s.i - s.j)

def BoundsInvariant {α : Type} (p : Pattern α) (s : State) : Prop :=
  s.j ≤ p.length ∧ s.i ≥ s.j

def LPSValid {α : Type} (p : Pattern α) (lps : List Nat) : Prop :=
  lps.length = p.length ∧
  ∀ j, j < p.length →
    match lps[j]? with
    | none => False
    | some k =>
        k ≤ j ∧
        (k > 0 → p.take k <+: (p.take (j + 1)).drop (j + 1 - k))

end KMP
