import Data.Char
--1
countVocale :: String -> Int
countVocale [] = 0
countVocale (x:xs) =
    if x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u'
        then 1 + countVocale(xs)
        else countVocale(xs) 


nrVocale :: [String] -> Int
nrVocale [] = 0
nrVocale (x:xs) = 
    if reverse(x) == x
        then countVocale(x) + nrVocale(xs)
        else
            nrVocale(xs)

--2
f :: Int -> [Int] -> [Int]
f _ [] = []

f nr (x:xs) =
    if even x
        then [x] ++ [nr] ++ f nr xs
        else [x] ++ f nr xs

--3
divizori :: Int -> [Int]
divizori x = [y | y <- [1 .. x], mod x y == 0]

--4
listadiv :: [Int] -> [[Int]]
listadiv [] = []
listadiv (x:xs) = 
    [divizori x] ++ listadiv xs


--5a
inIntervalRec :: Int -> Int -> [Int] -> [Int]
inIntervalRec x y [] = []
inIntervalRec x y (z:zs) =
    if z >= x && z <= y
        then [z] ++ inIntervalRec x y zs
        else inIntervalRec x y zs
--5b
inIntervalComp :: Int -> Int -> [Int] -> [Int]
inIntervalComp x y lista = [z | z <- lista, z >= x, z <= y]

--6a
pozitiveRec :: [Int] -> Int
pozitiveRec [] = 0
pozitiveRec (x:xs) =
    if x > 0
        then 1 + pozitiveRec xs
        else pozitiveRec xs

--6b
pozitiveComp :: [Int] -> Int
pozitiveComp lista = length [x | x <- lista, x > 0]


--7
auxiliar :: [Int] -> Int -> [Int]
auxiliar [] _ = []
auxiliar (x:xs) i
    | odd x = i:auxiliar xs (i+1)
    | otherwise = auxiliar xs (i+1)


pozitiiImpareRec :: [Int] -> [Int]
pozitiiImpareRec l = auxiliar l 0


--7b
pozitiiImpareComp :: [Int] -> [Int]
pozitiiImpareComp ls = [x | (i,x) <- zip ls [0..], odd i]

--8a
multDigitsRec :: String -> Int
multDigitsRec [] = 1
multDigitsRec (x:xs)
    | isDigit x = (digitToInt (x)) * (multDigitsRec xs)
    | otherwise = multDigitsRec xs

--8b
multDigitsComp :: String -> Int
multDigitsComp lista = multDigitsRec[x | x <- lista, isDigit x]