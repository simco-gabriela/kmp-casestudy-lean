import Kmpstudy.KMP.Algorithm

def main : IO Unit := do
  --test 1: pattern found
  let text : List Char := ['a', 'b', 'a', 'b', 'c']
  let pattern : List Char := ['a', 'b']
  match KMP.kmpFirst? text pattern with
  | some idx => IO.println s!"Found at index {idx}"
  | none => IO.println "Not found"

  -- test 2: pattern not found
  let text2 : List Char := ['a', 'b', 'c']
  let pattern2 : List Char := ['x', 'y']
  match KMP.kmpFirst? text2 pattern2 with
  | some idx => IO.println s!"Found at index {idx}"
  | none => IO.println "Not found"

  -- test 3: empty pattern
  let text3 : List Char := ['a', 'b', 'c']
  let pattern3 : List Char := []
  match KMP.kmpFirst? text3 pattern3 with
  | some idx => IO.println s!"Empty pattern found at index {idx}"
  | none => IO.println "Empty pattern not found"
