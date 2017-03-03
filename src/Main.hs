{-|
Module      : Main
Description : function decomposition
Copyright   : (c) John Burnett, 2017
License     : GPL-3
Maintainer  : john.burnett.c@gmail.com

takes a function f:A -> B and describes its decomposition
f:A -> B == A -g-> (A/~) -f~-> im f -h-> B
where g is surjective, f~ is bijective, and h is injective
-}

module Main where

-- equivalence relation type
type Rel' a = a -> a -> Bool

-- equivalence relation utilities
emptyR' :: Rel' a
emptyR' _ _ = False

list2rel' :: Eq a => [(a,a)] -> Rel' a
list2rel' xys x y = (x,y) `elem` xys

rel2list' :: Rel' a -> [a] -> [(a, a)]
rel2list' r xs = [(a,b) | a <- xs, b <- xs, inR' r (a,b)]

-- equivalence relation wrt to idA
idR' :: (Eq a) => [a] -> Rel' a
idR' xs x y = x == y && elem x xs

-- check if two elements of A are related
inR' :: Rel' a -> (a,a) -> Bool
inR' = uncurry

-- cartesian product A x B
cart :: [a] -> [a] -> [(a,a)]
cart xs ys = [(a,b) | a <- xs, b <- ys]

-- natural projections of A x B
natProjA' :: [(a,a)] -> [a]
natProjA' xs = [a | (a,b) <- xs]

natProjB' :: [(a,a)] -> [a]
natProjB' xs = [b | (a,b) <- xs]

-- intersection of two sets
intersect :: (Num a, Eq a) => [a] -> [a] -> [a]
intersect xs ys = [x | x <- xs, y <- ys, x == y]

-- some function f:A -> B
f :: (Num a) => [a] -> [a]
f xs = [x * x | x <- xs]

main :: IO ()
main = do
    let z = [-1000..1000] :: [Int]  -- A c Z && B c Z
    let setA = [0..10] :: [Int]
    let setB = f setA

    let eqRel = idR' setA
    let natProjA = natProjA' (rel2list' eqRel setA)
    let imF = f natProjA
    let inject = imF `intersect` z

    putStrLn "f:A -> B where a |-> a^2 and A,B are sets of integers"
    putStr "A := "
    print setA

    putStrLn "\nf:A -> B == A -g-> (A/~) -f~-> im f -h-> B"
    putStrLn "where g is surjective, f~ is bijective, and h is injective"

    putStrLn "\ng:A -> (A/~) where g(A) := (A/==)"
    putStr "(A/~) := "
    print (rel2list' eqRel setA)

    putStrLn "\nf~:(A/~) -> im f where f~(A~) := natProjA(A/~) := im f"
    putStr "im f := "
    print imF

    putStrLn "\nh:im f -> B where h(im f) = im f `intersect` Z"
    putStr "B := "
    print inject

    putStr "\nf(A) == B is "
    print (inject == setB)
