--EXERCITIUL 1
data Punct = Pt [Int]

data Arb = Vid | F Int | N Arb Arb
            deriving Show

class ToFromArb a where
    toArb :: a -> Arb
    fromArb :: Arb -> a

--1.a

afisare :: [Int] -> String
afisare [element] = show element
afisare (x:xs) = show x ++ "," ++ afisare xs
instance Show Punct where
        show (Pt a) = "(" ++ (afisare a) ++ ")"

--1.b
(++) :: Punct -> Punct -> Punct
Pt l1 ++ Pt l2 = Pt (l1 ++ l2)

instance (ToFromArb Punct) where
    toArb :: Punct -> Arb
    toArb (Pt []) = Vid
    toArb (Pt (x:xs)) = N (F x) (toArb (Pt xs))

    fromArb :: Arb -> Punct
    fromArb Vid = Pt []
    fromArb (F x) = Pt [x]
    fromArb (N ram1 ram2) = fromArb ram1 ++ fromArb ram2

--2
--2.a
data Geo a = Square a | Rectangle a a | Circle a
        deriving Show

class GeoOps g where
    perimeter :: (Floating a) => g a -> a
    area :: (Floating a) => g a -> a

instance GeoOps Geo where
    perimeter (Square a) = a * 4
    perimeter (Rectangle a b) = a * 2 + b * 2
    perimeter (Circle a) = 2*pi*a
    area (Square a) = a * a
    area (Rectangle a b) = a * b
    area (Circle a) = pi * a * a

--2.b
-- class Eq eq where
--     egal :: eq a -> eq b-> Bool

-- instance Equ Geo where
--     egal (Square a) (Square b) = perimeter (Square a) == perimeter (Square b)

instance (Floating a, Eq a) => Eq (Geo a) where
    -- (==) (Square a) (Square b) = perimeter (Square a) == perimeter (Square b)
    -- (==) (Rectangle a b) (Rectangle c d) = perimeter (Rectangle a b) == perimeter (Rectangle c d)
    -- (==) (Circle a) (Circle b) = perimeter (Circle a) == perimeter (Circle b)
    figa == figb = perimeter figa == perimeter figb