# decomp
Function decomposition in Haskell.

If `A, B` are sets then for all `f:A -> B`,
```
f:A -> B = A -g-> (A/~) -f~-> im f -h-> B
```
such that `g` is surjective, `f~` is bijective, and `h` is injective.
