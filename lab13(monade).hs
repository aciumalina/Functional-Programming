import Data.Char(intToDigit)
{- Monada Maybe este definita in GHC.Base 

instance Monad Maybe where
  return = Just
  Just va  >>= k   = k va
  Nothing >>= _   = Nothing


instance Applicative Maybe where
  pure = return
  mf <*> ma = do
    f <- mf
    va <- ma
    return (f va)       

instance Functor Maybe where              
  fmap f ma = pure f <*> ma   
-}

--ex 1
pos :: Int -> Bool
pos  x = if (x>=0) then True else False

fct :: Maybe Int ->  Maybe Bool
fct  mx =  mx  >>= (\x -> Just (pos x))

--functia de mai sus redefinita cu do
-- fctDo :: Maybe Int ->  Maybe Bool
-- fctDo mx = do
--     x <- mx
--     if (pos x) then Just (pos x)
--     else Nothing

--1.2
fctDo :: Maybe Int ->  Maybe Bool
fctDo mx = do
    x <- mx
    Just (pos x)

--2.1 forma 1
addM :: Maybe Int -> Maybe Int -> Maybe Int
addM Nothing Nothing = Nothing
addM (Just a) Nothing = Nothing
addM Nothing (Just b) = Nothing
addM (Just a) (Just b) = Just (a + b)

--2.1 forma 2 cu case
addMDif :: Maybe Int -> Maybe Int -> Maybe Int
addMDif a b =
  case a of
    Nothing -> Nothing
    Just x -> case b of
              Nothing -> Nothing
              Just y -> Just (x + y)

--2.2
addMMonada:: Maybe Int -> Maybe Int -> Maybe Int
addMMonada mx my = do
  x <- mx
  y <- my
  Just (x+y)

--3
cartesian_product xs ys = xs >>= ( \x -> (ys >>= \y-> return (x,y)))

cartesian_product_Do xs ys = do
  x <- xs
  y <- ys
  return (x,y)

--forma prod fara do
prod f xs ys = [f x y | x <- xs, y<-ys]
prodDo f xs ys = do
  x <- xs
  y <- ys
  return (f x y)

--forma fara do
myGetLine :: IO String
myGetLine = getChar >>= \x ->
      if x == '\n' then
          return []
      else
          myGetLine >>= \xs -> return (x:xs)

myGetLineDo :: IO String
myGetLineDo = do
  x <- getChar
  if x == '\n' then
    return []
    else do
      xs <- myGetLineDo
      return (x:xs)
  
prelNo noin =  sqrt noin
ioNumber = do
     noin  <- readLn :: IO Float
     putStrLn $ "Intrare\n" ++ (show noin)
     let noout = prelNo noin
     putStrLn $ "Iesire"
     print noout

ioNumberFaraDo = (readLn :: IO Float) >>= \noin -> putStrLn ( "Intrare\n" ++ (show noin)) >> let noout = prelNo noin in (putStrLn $ "Iesire") >> print noout

data Person = Person { name :: String, age :: Int }

showPersonN :: Person -> String
showPersonN (Person nume age) = "NUME: " ++ nume
showPersonA :: Person -> String
showPersonA (Person nume age) = "AGE: " ++ show age

{-
showPersonN $ Person "ada" 20
"NAME: ada"
showPersonA $ Person "ada" 20
"AGE: 20"
-}
showPerson :: Person -> String
showPerson (Person n a) = showPersonN (Person n a) ++ ", " ++ showPersonA (Person n a)



{-
showPerson $ Person "ada" 20
"(NAME: ada, AGE: 20)"
-}


newtype Reader env a = Reader { runReader :: env -> a }


instance Monad (Reader env) where
  return x = Reader (\_ -> x)
  ma >>= k = Reader f
    where f env = let a = runReader ma env
                  in  runReader (k a) env



instance Applicative (Reader env) where
  pure = return
  mf <*> ma = do
    f <- mf
    a <- ma
    return (f a)       

instance Functor (Reader env) where              
  fmap f ma = pure f <*> ma    

mshowPersonN ::  Reader Person String
mshowPersonN = Reader (\p -> "NAME: " ++ (name p))


mshowPersonA ::  Reader Person String
mshowPersonA = Reader (\p -> "AGE: " ++ (show $ age p))
mshowPerson ::  Reader Person String
mshowPerson = Reader (\p -> "NAME: " ++ (name p) ++ ",AGE: "++ (show $ age p))
mshowPerson2 = do
    n <- mshowPersonN
    a <- mshowPersonA
    return (n ++ " " ++ a)
{-
runReader mshowPersonN  $ Person "ada" 20
"NAME:ada"
runReader mshowPersonA  $ Person "ada" 20
"AGE:20"
runReader mshowPerson  $ Person "ada" 20
"(NAME:ada,AGE:20)"
-}

--EXERCITIILE 5 INCOLO
--- Monada Writer

newtype WriterS a = Writer { runWriter :: (a, String) }
                    deriving Show


instance Monad WriterS where
  return va = Writer (va, "")
  ma >>= k = let (va, log1) = runWriter ma
                 (vb, log2) = runWriter (k va)
             in  Writer (vb, log1 ++ log2)


instance  Applicative WriterS where
  pure = return
  mf <*> ma = do
    f <- mf
    a <- ma
    return (f a)       

instance  Functor WriterS where              
  fmap f ma = pure f <*> ma     

tell :: String -> WriterS () 
tell log = Writer ((), log)
  
logIncrement :: Int  -> WriterS Int
logIncrement x = do
    tell ("increment: " ++ show x ++ " ")
    return (x + 1)

logIncrement2 :: Int  -> WriterS Int
logIncrement2 x = do
    y <- logIncrement x
    logIncrement y

logIncrementN :: Int -> Int -> WriterS Int
logIncrementN x n = do
    if n == 0 then return x
        else do
            logIncrement x
            logIncrementN (x+1) (n-1)
   
--EXERCITIU PROPUS DE RADU
checkVocale :: String -> Bool
checkVocale [] = False
checkVocale (x:xs)
  | elem x "aeiouAEIOU" = True
  | otherwise = checkVocale xs

filtru :: [String] -> Maybe String
filtru ls 
  | length (filter (\x -> checkVocale x == False) ls) > 0 = Just $ maximum' (filter (\x -> checkVocale x == False) ls)
  | otherwise = Nothing

maximum' :: [String] -> String
maximum' [cuv] = cuv
maximum' (x:xs)
  | (length (maximum' xs) > length x) = maximum' xs
  | otherwise = x


                  
