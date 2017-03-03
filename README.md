# decomp
Function decomposition in Haskell.

If `A, B` are sets then for all `f:A -> B`,
```
f:A -> B = A -g-> (A/~) -f~-> im f -h-> B
```
where `g` is surjective, `f~` is bijective, and `h` is injective.

### output
```
f:A -> B where a |-> a^2 and A,B are sets of integers
A := [0,1,2,3,4,5,6,7,8,9,10]

f:A -> B == A -g-> (A/~) -f~-> im f -h-> B
where g is surjective, f~ is bijective, and h is injective

g:A -> (A/~) where g(A) := (A/==)
(A/~) := [(0,0),(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10)]

f~:(A/~) -> im f where f~(A~) := natProjA(A/~) := im f
im f := [0,1,4,9,16,25,36,49,64,81,100]

h:im f -> B where h(im f) = im f `intersect` Z
B := [0,1,4,9,16,25,36,49,64,81,100]

f(A) == B is True
```
