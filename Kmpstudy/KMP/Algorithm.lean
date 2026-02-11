import Kmpstudy.Basic.Strings
import Kmpstudy.Basic.PrefixSuffix
import Mathlib.Data.List.Basic

namespace KMP

structure State where
  i : Nat
  j : Nat
  deriving Repr

def step {α : Type} [DecidableEq α]
    (t : Text α) (p : Pattern α) (lps : List Nat) (s : State) : State :=
  match t[s.i]?, p[s.j]? with
  | some ti, some pj =>
      if ti = pj then
        { i := s.i + 1, j := s.j + 1 }
      else if s.j = 0 then
        { i := s.i + 1, j := 0 }
      else
        { i := s.i, j := lps.getD (s.j - 1) 0 }
  | _, _ => s

def done {α : Type} (t : Text α) (p : Pattern α) (s : State) : Bool :=
  (s.j == p.length) || (t[s.i]?.isNone)

def found? {α : Type} (p : Pattern α) (s : State) : Option Nat :=
  if s.j = p.length then some (s.i - p.length) else none

def runFuel {α : Type} [DecidableEq α]
    (t : Text α) (p : Pattern α) (lps : List Nat) : Nat → State → Option Nat
  | 0, _ => none
  | fuel+1, s =>
      match found? p s with
      | some k => some k
      | none =>
          if done t p s then none
          else runFuel t p lps fuel (step t p lps s)

def kmpFirst? {α : Type} [DecidableEq α] (t : Text α) (p : Pattern α) : Option Nat :=
  let lpsTable := lps (α := α) p
  let fuel := (t.length + 1) * (p.length + 1)
  runFuel t p lpsTable fuel { i := 0, j := 0 }

end KMP
