import Data.List
import Data.Tuple
import Control.Applicative

--1
factori :: Int -> [Int]
factori x = [y | y <- [1 .. x], mod x y == 0]

--2
prim :: Int -> Bool
prim n
    | length (factori n) == 2 = True
    | otherwise = False

--3
numerePrime :: Int -> [Int]
numerePrime n = [x | x <- [2..n], prim x]


--4
myzip3 :: [Int] -> [Int] -> [Int] -> [(Int, Int, Int)]
myzip3 x y z = [(a,b,c) | (a,(b,c)) <- zip x (zip y z) ]


--5
firstEl :: [(a,b)] -> [a]
firstEl n = map (fst) n

--6
sumList :: [[Int]] -> [Int]
sumList lista = map (sum) lista

--7
pre12 :: [Int] -> [Int]
pre12 lista = map (\x -> if odd x then x * 2 else div x 2) lista

--8
functie :: Char -> [String] -> [String]
functie x lista = filter (elem x) lista

--9
patrate :: [Int] -> [Int]
patrate lista = map (^2) . filter (odd) $ lista

--10
patratPozImp :: [Int] -> [Int]
-- patratPozImp lista = map (^2) . filter (\x -> x <- [odd x, (y,x) <- zip lista [0..]]) $ lista

patratPozImp lista = map (\(x,y) -> x ^ 2) (filter (\(x,y) -> odd y) (zip lista [0..]))

--11
eliminConsoane :: String -> String
eliminConsoane [] = ""
eliminConsoane (x:xs)
    | elem x "aeiouAEIOU" = [x] ++ eliminConsoane(xs)
    | otherwise = eliminConsoane(xs)

numaiVocale :: [String] -> [String]
numaiVocale lista = map (eliminConsoane) lista

--12
mymap :: (a -> b) -> [a] -> [b]
mymap f [] = []
mymap f (x:xs) = f x : mymap f xs

myfilter :: (a -> Bool) -> [a] -> [a]
myfilter p [] = []
myfilter p (x:xs)
    | p x = x : myfilter p xs
    | otherwise = myfilter p xs


