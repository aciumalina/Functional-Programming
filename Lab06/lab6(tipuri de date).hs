-- data Fruct
--     = Mar String Bool
--     | Portocala String Int

-- listaFructe = [Mar "Ionatan" False,
--     Portocala "Sanguinello" 10,
--     Portocala "Valencia" 22,
--     Mar "Golden Delicious" True,
--     Portocala "Sanguinello" 15,
--     Portocala "Moro" 12,
--     Portocala "Tarocco" 3,
--     Portocala "Moro" 12,
--     Portocala "Valencia" 2,
--     Mar "Golden Delicious" False,
--     Mar "Golden" False,
--     Mar "Golden" True]

-- --1.a
-- ePortocalaDeSicilia :: Fruct -> Bool
-- ePortocalaDeSicilia (Portocala a b) = if (a == "Tarocco" || a == "Moro" || a == "Sanguinello")
--                                         then True
--                                         else False
-- ePortocalaDeSicilia (Mar a b) = False

-- --1.b
-- nrFeliiSicilia :: [Fruct] -> Int

-- nrFeliiSicilia [] = 0
-- nrFeliiSicilia (Portocala a b:xs)
--     | ePortocalaDeSicilia (Portocala a b) = b + nrFeliiSicilia xs
--     | otherwise = nrFeliiSicilia xs
-- nrFeliiSicilia (Mar a b:xs) = nrFeliiSicilia xs

-- --1.c
-- nrMereViermi :: [Fruct] -> Int
-- nrMereViermi [] = 0
-- nrMereViermi (Mar a b:xs)
--     | b == True = 1 + nrMereViermi xs
--     |otherwise = nrMereViermi xs

-- nrMereViermi (Portocala a b:xs) = nrMereViermi xs

-- --2
-- type NumeA = String
-- type Rasa = String
-- data Animal = Pisica NumeA | Caine NumeA Rasa
--             deriving Show

-- --2.a
-- vorbeste :: Animal -> String
-- vorbeste (Pisica a) = "Meow!"
-- vorbeste (Caine a b) = "Woof!"

-- --2.b
-- rasa :: Animal -> Maybe String
-- rasa (Caine a b) = Just b 
-- rasa (Pisica a) = Nothing

-- --3
-- data Linie = L [Int]
--     deriving Show
-- data Matrice = M [Linie]
--     deriving Show

-- -- data Linie = L [Int]
-- --   deriving (Show)

-- -- data Matrice = M [Linie]
-- --   deriving (Show)

-- -- verifica :: Matrice -> Int -> Bool
-- -- verifica (M mat) n = foldr (&&) True (map (\(L ls) -> (sum ls) == n) mat)

-- -- pozLinie :: [Int]->Bool
-- -- pozLinie []=True
-- -- pozLinie (x:xs)= (x>0) && pozLinie (xs)

-- -- doarPozN :: Matrice -> Int -> Bool
-- -- doarPozN (M mat) n = foldr (&&) True (map(\(L ls)->if length ls==n
-- --                                                         then pozLinie ls
-- --                                                         else True) mat)

-- -- lung::Linie->Int
-- -- lung (L linie)= length linie
-- -- ll::Matrice->Int
-- -- ll (M mat)=lung (head mat)
-- -- corect :: Matrice -> Bool
-- -- corect (M mat)= foldr (&&) True (map(\(L ls)->(length ls)==ll (M mat)) mat)


-- --se da o lista de nr intregi, suma
-- sumaMea :: [Int] -> Int
-- sumaMea lista = foldr (+) 0 lista

                    
-- foo2 :: (Int, (Char,String)) -> String
-- foo2 = undefined

-- foo1 :: (Int,Char,String) -> String
-- foo1 = undefined

-- foo3 :: Int -> Char -> String
-- foo3 = undefined

-- data Mood = Blah
--             | Woot
--             deriving (Show, Eq)

-- settleDown x = if x == Woot
--                     then Blah
--                     else x





