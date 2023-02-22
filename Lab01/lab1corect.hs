-- myInt = 55555555555555555555555555555555555555555555555555555555555
-- double :: Integer -> Integer
-- double x = x+x

--squareSum :: Integer -> Integer -> Integer
--squareSum x y = x^2 + y^2::

-- main :: IO()
-- main = do
--     functie x let x in 
--         if (x % 2 == 0)
--             then print ( "par" )
--         else
--             print ( "impar" )

maxim :: Integer -> Integer -> Integer
maxim x y = if (x > y) then x else y
-- maxim x y =
--     if (x > y)
--         then x
--         else y

maxim3 :: Integer -> Integer -> Integer -> Integer
maxim3 x y z = 
    if (x > y && x > z)
            then x
        else
            if (y > z)
                then y
                else z


maxim4 :: Integer -> Integer -> Integer -> Integer -> Integer
maxim4 x y z t = 
    let 
        u = maxim3 x y z
    in
        maxim u t

testmaxim ::  Integer -> Integer -> Integer -> Integer -> Bool
testmaxim x y z t =
    let
        u = maxim4 x y z t
    in 
        u >= x && u >= y && u >=z && u >= t

testnumber :: Integer -> [Char]
testnumber x = 
    if (mod x 2) == 1
        then "Impar"
        else "Par"

factor :: Integer -> Integer
factor 0 = 1
factor n = n * factor (n-1)

verificare :: Integer -> Integer -> Bool
verificare x y =
    x > y * 2
