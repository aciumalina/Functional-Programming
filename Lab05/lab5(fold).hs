--1
ex1 :: [Int] -> Int
ex1 lista = foldr (+) 0 . map (^2) . filter (odd) $ lista

--2
ex2 :: [Bool] -> Bool
ex2 lista = if foldr (&&) True lista == True
                then True
                else False

--3
allVerifies :: (Int -> Bool) -> [Int] -> Bool
allVerifies functie lista = foldr (\x acc -> functie x && acc) True lista

--4
anyVerifies :: (Int -> Bool) -> [Int] -> Bool
anyVerifies functie lista = foldr (\x acc -> functie x || acc) False lista

--6
listToInt :: [Int] -> Int
listToInt lista = foldl (\acc x -> acc * 10 + x) 0 lista

--7.a
rmChar :: Char -> String -> String
rmChar chr cuv = filter (\x -> x /= chr) cuv

--7.b - varianta 1
rmCharsRec :: String -> String -> String
rmCharsRec cuv [] = []
rmCharsRec cuv (x:xs)
    | elem x cuv = rmCharsRec cuv xs 
    | otherwise = [x] ++ rmCharsRec cuv xs 

--7.b - varianta 2
-- rmCharsRec [] s2 = s2
-- rmCharsRec (c:s1) s2 = rmCharsRec s1 (rmChar c s2)

--7.c
rmCharsFold :: String -> String -> String
rmCharsFold cuv1 cuv2 = foldr rmChar cuv2 cuv1



