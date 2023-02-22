import Data.Char(digitToInt)
import Data.Char(intToDigit)
import Data

twoBinds :: IO ( )
twoBinds =
    putStrLn "name pls : " >>
    getLine >>=
    \ name ->
    putStrLn " age pls : " >>
    getLine >>=
    \ age ->
    putStrLn ( " hello "
    ++ name ++ " who is "
    ++ age ++ " years old " )


newtype Writer log a = Writer {runWriter :: ( a , log ) }
                        deriving Show
f :: Int -> Writer String Int
f x = if x < 0 then ( Writer (-x , "negativ " ) )
        else ( Writer ( x , "pozitiv" ) )


readInput :: IO()
readInput = do
    line <- getLine
    putStrLn line

readInput2 :: IO()
readInput2 = do
    --line <- getLine
    putStrLn "introdu numele"
    nume <- getLine
    putStrLn ("Numele tau este " ++ nume)

readLineDo :: IO String
readLineDo = do
    x <- getChar
    if x == '\n' then
        return []
    else do
        xs <- readLineDo
        return (x:xs)

citesteNumere :: IO String
citesteNumere = do
    x <- getChar
    let z = digitToInt x
    let t = z+2
    let chr = intToDigit t
    if x == '\n' then
        return []
    else do
        xs <- citesteNumere
        return (chr:xs)

--subiect 2 examen
getFromInterval :: Int -> Int -> [Int] -> [Int]
getFromInterval a b lista = [x | x <- lista, x >= a && x <= b]

-- getFromIntMonad :: Int -> Int -> [Int] -> [Int]
-- getFromIntMonad a b (x:xs) = do
--     ls <- xs
--     if x >= a && x <= b then do
--         remainder <- (getFromIntMonad a b ls)
--         return (x)
--     else do
--         remainder <- (getFromIntMonad a b ls)
--         return (remainder)

--VARIANTA CARE FUNCTIONEAZA
getFromIntMonad :: Int -> Int -> [Int] -> [Int]
getFromIntMonad a b ls = do
    x <- ls
    if a <= x && x <= b then return x else []

--EXERCITII LABORATOR 13


