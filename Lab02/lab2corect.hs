import Data.Char (ord)
poly2 :: Double -> Double -> Double -> Double -> Double
poly2 a b c x =
    a*x^2 + b*x + c

eeny :: Integer ->String
eeny x =
    if even x
        then "eeny"
    else "meeny"

fizzbuzz :: Integer -> String
-- fizzbuzz x =
--     if mod x 15 == 0
--         then "FizzBuzz"
--         else
--             if mod x 5 == 0
--                 then "Buzz"
--                 else
--                     if mod x 3 == 0
--                         then "fizz"
--                         else
--                             ""

fizzbuzz a
    | mod a 15 == 0 = "FizzBuzz"
    | mod a 5 == 0 = "Buzz"
    | mod a 3 == 0 = "Fizz"
    | otherwise = ""


fibonacciCazuri :: Integer -> Integer
fibonacciCazuri n
    | n < 2     = n
    | otherwise = fibonacciCazuri (n - 1) + fibonacciCazuri (n - 2)


fibonacciEcuational :: Integer -> Integer
fibonacciEcuational 0 = 0
fibonacciEcuational 1 = 1
fibonacciEcuational n =
    fibonacciEcuational (n - 1) + fibonacciEcuational (n - 2)

tribonacci :: Integer -> Integer
tribonacci x 
    | x < 3 = 1
    | x == 3 = 2
    | otherwise = tribonacci(x-1) + tribonacci(x-2) + tribonacci(x-3)


tribonacciEc :: Integer -> Integer
tribonacciEc 1 = 1
tribonacciEc 2 = 1
tribonacciEc 3 = 2
tribonacciEc n =
    tribonacciEc(n-1) + tribonacciEc(n-2) + tribonacciEc(n-3) 

binomial :: Integer -> Integer -> Integer
binomial n 0 = 1
binomial 0 k = 0
binomial n k = binomial (n-1) k + binomial (n-1) (k-1)



verifL :: [Int] -> Bool
verifL a =
    if mod (length a) 2 == 0
        then True
        else False

takefinal :: [Int] -> Int -> [Int]
takefinal ls n =
    reverse(take n (reverse ls))


remove :: [Int] -> Int -> [Int]
remove ls n =
    take n ls ++ reverse(take (length ls - n - 1) (reverse ls))

myreplicate :: Int -> Int -> [Int]
myreplicate 0 v = []
myreplicate n v =
    [v] ++ myreplicate (n-1) v


sumImp :: [Int] -> Int
sumImp [] = 0
sumImp ls = 
    if mod ((take 1 ls) !! 0) 2 == 1
        then (take 1 ls) !! 0 + sumImp (tail ls)
        else 0 + sumImp (tail ls)


totalLen :: [String] -> Int
totalLen [] = 0
totalLen ls = 
    if ((take 1 ls) !! 0) !! 0== 'A'
        then length ((take 1 ls) !! 0) + totalLen (tail ls)
        else totalLen (tail ls)


        






