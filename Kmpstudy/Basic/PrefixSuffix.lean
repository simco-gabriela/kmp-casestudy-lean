import Kmpstudy.Basic.Strings
import Mathlib.Data.List.Basic
import Mathlib.Data.List.Range
import Mathlib.Data.Nat.Find

namespace KMP

def isBorderB {α : Type} [DecidableEq α] (s : List α) (k : Nat) : Bool :=
  (k < s.length) && decide (s.take k = s.drop (s.length - k))

def lpsVal {α : Type} [DecidableEq α] (s : List α) : Nat :=
  Nat.findGreatest (fun k => isBorderB (α := α) s k = true) s.length

def lps {α : Type} [DecidableEq α] (p : Pattern α) : List Nat :=
  (List.range p.length).map (fun i => lpsVal (α := α) (p.take (i + 1)))

theorem lps_length {α : Type} [DecidableEq α] (p : Pattern α) :
  (lps (α := α) p).length = p.length := by
  simp [lps, List.length_map, List.length_range]

theorem lpsVal_le_length {α : Type} [DecidableEq α] (s : List α) :
  lpsVal (α := α) s ≤ s.length := by
  simp [lpsVal]
  exact Nat.findGreatest_le s.length

end KMP
