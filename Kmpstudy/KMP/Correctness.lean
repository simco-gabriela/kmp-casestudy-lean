import Kmpstudy.Basic.Strings
import Kmpstudy.KMP.Algorithm
import Kmpstudy.KMP.Invariant
import Mathlib.Data.List.Basic

namespace KMP

theorem invariant_init {α : Type} (t : Text α) (p : Pattern α) :
    Invariant (α := α) t p { i := 0, j := 0 } := by
  constructor
  · -- j ≤ p.length
    simp
  constructor
  · -- i ≥ j
    simp
  · -- MatchesAt t (p.take 0) 0
    simp [MatchesAt]

theorem take_take_min {α : Type} (l : List α) (n m : Nat) :
    (l.take n).take m = l.take (min n m) := by
  rw [List.take_take, Nat.min_comm]


theorem found_sound {α : Type} (t : Text α) (p : Pattern α) (s : State)
    (h_inv : Invariant (α := α) t p s)
    (h_found : found? (α := α) p s = some k) :
    MatchesAt (α := α) t p k := by
  unfold found? at h_found
  split at h_found
  · -- case: s.j = p.length
    rename_i heq
    injection h_found with hk
    subst hk
    obtain ⟨hj_le, ⟨hi_ge, hmatch⟩⟩ := h_inv
    rw [heq, List.take_length] at hmatch
    exact hmatch
  · -- case: s.j ≠ p.length
    contradiction

theorem empty_pattern_matches {α : Type} (t : Text α) :
    MatchesAt (α := α) t [] 0 := by
  exact empty_matches t 0

theorem kmpFirst_sound {α : Type} [DecidableEq α] (t : Text α) (p : Pattern α)
    (h : kmpFirst? t p = some k) :
    MatchesAt (α := α) t p k := by
  unfold kmpFirst? at h
  generalize hlps : lps p = lpsTable
  generalize hfuel : (t.length + 1) * (p.length + 1) = fuel
  have hinv : Invariant t p { i := 0, j := 0 } := invariant_init t p
  sorry

theorem getElem?_drop_add {α : Type} (t : List α) (k j : Nat) :
    (t.drop k)[j]? = t[k + j]? := by
  rw [List.getElem?_drop]

theorem head?_eq_getElem?_zero {α : Type} (l : List α) :
    l.head? = l[0]? := by
  cases l <;> rfl

theorem take_succ_append {α : Type} (p : List α) (j : Nat) (hj : j < p.length) :
    p.take (j + 1) = p.take j ++ [p[j]] := by
  induction p generalizing j with
  | nil =>
    simp at hj
  | cons head tail ih =>
    cases j with
    | zero =>
      simp [List.take]
    | succ n =>
      simp only [List.take, List.getElem_cons_succ]
      have : n < tail.length := Nat.succ_lt_succ_iff.mp hj
      rw [ih n this]
      -- Goal: head :: (List.take n tail ++ [tail[n]]) = (head :: List.take n tail) ++ [tail[n]]
      rw [List.cons_append]

theorem IsPrefix.extend_one {α : Type} (p t : List α) (j : Nat) (x : α)
    (h_prefix : p.take j <+: t)
    (h_j_lt : j < p.length)
    (h_t_elem : t[j]? = some x)
    (h_p_elem : p[j]? = some x) :
    p.take (j + 1) <+: t := by
  obtain ⟨tail, h_eq⟩ := h_prefix

  have h_take_expand : p.take (j + 1) = p.take j ++ [x] := by
    rw [take_succ_append p j h_j_lt]
    congr
    have hp : p[j]? = some p[j] := List.getElem?_eq_getElem h_j_lt
    rw [hp] at h_p_elem
    simp at h_p_elem
    exact h_p_elem

  have h_tail_head : ∃ tail', tail = x :: tail' := by
    have h_index : t[j]? = (p.take j ++ tail)[j]? := by rw [← h_eq]
    rw [List.getElem?_append_right] at h_index
    · simp [List.length_take, Nat.min_eq_left (Nat.le_of_lt h_j_lt)] at h_index
      rw [h_t_elem] at h_index
      cases tail with
      | nil => simp at h_index
      | cons y tail' =>
        simp at h_index
        subst h_index
        exact ⟨tail', rfl⟩
    · rw [List.length_take]
      simp [Nat.min_eq_left (Nat.le_of_lt h_j_lt)]

  obtain ⟨tail', rfl⟩ := h_tail_head
  rw [h_take_expand, ← h_eq]
  use tail'
  rw [List.append_assoc]
  rfl

theorem match_extends {α : Type} (t : Text α) (p : Pattern α) (i j : Nat) (ti pj : α)
    (h_match : MatchesAt (α := α) t (p.take j) i)
    (h_j_lt : j < p.length)
    (h_i_bound : i + j < t.length)
    (h_ti : t[i + j]? = some ti)
    (h_pj : p[j]? = some pj)
    (h_eq : ti = pj) :
    MatchesAt (α := α) t (p.take (j + 1)) i := by
  unfold MatchesAt at h_match ⊢

  have h_drop_j : (t.drop i)[j]? = some pj := by
    rw [getElem?_drop_add]
    rw [h_ti, h_eq]

  apply IsPrefix.extend_one
  · exact h_match
  · exact h_j_lt
  · exact h_drop_j
  · exact h_pj


theorem step_preserves_invariant_match
    {α : Type} [DecidableEq α]
    (t : Text α) (p : Pattern α) (lps : List Nat) (s : State)
    (ti pj : α)
    (h_inv : Invariant (α := α) t p s)
    (h_ti : t[s.i]? = some ti)
    (h_pj : p[s.j]? = some pj)
    (h_eq : ti = pj) :
    Invariant (α := α) t p (step t p lps s) := by
  unfold step
  rw [h_ti, h_pj]
  simp only [h_eq, ↓reduceIte]
  unfold Invariant
  simp only
  obtain ⟨hj_le, hi_ge, hmatch⟩ := h_inv
  constructor
  · -- s.j + 1 ≤ p.length
    have : s.j < p.length := by
      by_contra h_not_lt
      push_neg at h_not_lt
      have : p.length ≤ s.j := h_not_lt
      rw [List.getElem?_eq_none] at h_pj
      · cases h_pj
      · omega
    omega
  constructor
  · -- s.i + 1 ≥ s.j + 1
    omega
  · -- MatchesAt t (p.take (s.j + 1)) ((s.i + 1) - (s.j + 1))
    have heq : (s.i + 1) - (s.j + 1) = s.i - s.j := by omega
    rw [heq]

    apply match_extends t p (s.i - s.j) s.j ti pj

    · exact hmatch

    --  s.j < p.length
    · by_contra h_not_lt
      push_neg at h_not_lt
      rw [List.getElem?_eq_none] at h_pj
      · cases h_pj
      · omega

    -- (s.i - s.j) + s.j < t.length
    ·
      have h_simplify : (s.i - s.j) + s.j = s.i := by omega
      rw [h_simplify]
      by_contra h_not_lt
      push_neg at h_not_lt
      rw [List.getElem?_eq_none] at h_ti
      · cases h_ti
      · omega

    -- t[(s.i - s.j) + s.j]? = some ti
    · have h_simplify : (s.i - s.j) + s.j = s.i := by omega
      rw [h_simplify]
      exact h_ti

    -- p[s.j]? = some pj
    · exact h_pj

    -- ti = pj
    · exact h_eq

theorem step_preserves_invariant_mismatch_j_zero
    {α : Type} [DecidableEq α]
    (t : Text α) (p : Pattern α) (lps : List Nat) (s : State)
    (ti pj : α)
    (h_inv : Invariant (α := α) t p s)
    (h_ti : t[s.i]? = some ti)
    (h_pj : p[s.j]? = some pj)
    (h_neq : ti ≠ pj)
    (h_j_zero : s.j = 0) :
    Invariant (α := α) t p (step t p lps s) := by
  unfold step
  rw [h_ti, h_pj]
  simp only [h_neq, ↓reduceIte]
  rw [h_j_zero]
  simp only [↓reduceIte]
  unfold Invariant
  simp only
  obtain ⟨hj_le, hi_ge, hmatch⟩ := h_inv
  constructor
  · -- 0 ≤ p.length
    omega
  constructor
  · -- s.i + 1 ≥ 0
    omega
  · -- MatchesAt t (p.take 0) (s.i + 1 - 0)
    simp [MatchesAt]

theorem step_preserves_invariant_end
    {α : Type} [DecidableEq α]
    (t : Text α) (p : Pattern α) (lps : List Nat) (s : State)
    (h_inv : Invariant (α := α) t p s)
    (h_no_chars : t[s.i]?.isNone ∨ p[s.j]?.isNone) :
    Invariant (α := α) t p (step t p lps s) := by
  unfold step
  cases h_no_chars with
  | inl h_ti_none =>
    -- t[s.i]? = none
    rw [Option.isNone_iff_eq_none] at h_ti_none
    rw [h_ti_none]
    -- Goal: Invariant t p (match none, p[s.j]? with | _, _ => s)
    cases p[s.j]? <;> exact h_inv
  | inr h_pj_none =>
    -- p[s.j]? = none
    rw [Option.isNone_iff_eq_none] at h_pj_none
    rw [h_pj_none]
    -- Goal: Invariant t p (match t[s.i]?, none with | _, _ => s)
    cases t[s.i]? <;> exact h_inv


end KMP
