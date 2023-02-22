--a
newtype Identity a = Identity a
                    deriving Show

instance Functor Identity where
    fmap f (Identity x) = Identity (f x)

--b
data Pair a = Pair a a
                deriving Show

instance Functor Pair where
    fmap f (Pair a b) = Pair (f a) (f b) 

--c
data Constant a b = Constant b
                    deriving Show

instance Functor (Constant b) where
    fmap f (Constant b) = Constant (f b)

--d
data Two a b = Two a b
                deriving Show

instance Functor (Two a) where
    fmap f (Two a x) = Two a (f x)

--e
data Three a b c = Three a b c
                    deriving Show

instance Functor (Three a b) where
    fmap f (Three a x y) = Three a x (f y)

--f
data Three' a b = Three' a b b
                deriving Show

instance Functor (Three' a) where
    fmap f (Three' a b c) = Three' a (f b) (f c)

--g
data Four a b c d = Four a b c d
                    deriving Show

instance Functor (Four a b c) where
    fmap f (Four a b c x) = Four a b c (f x)

--h
data Four'' a b = Four'' a a a b
                deriving Show

instance Functor (Four'' a) where
    fmap f (Four'' a b c d) = Four'' a b c (f d)

--i
data Quant a b = Finance | Desk a | Bloor b
                deriving Show

instance Functor (Quant a) where
    fmap f Finance = Finance
    fmap f (Desk a) = Desk a
    fmap f (Bloor b) = Bloor (f b)

--ex 2
--a
data LiftItOut f a = LiftItOut (f a)

-- instance Functor (LiftItOut f) where
--     fmap g (LiftItOut x) = LiftItOut (g x)

instance Functor f => Functor (LiftItOut f) where
    fmap g (LiftItOut fa) = LiftItOut (fmap g fa)

--b
data Parappa f g a = DaWrappa (f a) (g a)
                    deriving Show

instance (Functor f, Functor g) => Functor (Parappa f g) where
    fmap h (DaWrappa fa ga) = DaWrappa (fmap h fa) (fmap h ga)

--c
data IgnoreOne f g a b = IgnoringSomething (f a) (g b)

instance (Functor f, Functor g) => Functor (IgnoreOne f g a) where
    fmap h (IgnoringSomething fa gb) = IgnoringSomething fa (fmap h gb)

--d
data Notorious g o a t = Notorious (g o) (g a) (g t)

instance (Functor g) => Functor (Notorious g o a) where
    fmap h (Notorious go ga gt) = Notorious go ga (fmap h gt)

--e
data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)

instance Functor GoatLord where
    fmap f NoGoat = NoGoat
    fmap f (OneGoat a) = OneGoat (f a)
    fmap f (MoreGoats a b c) = MoreGoats (fmap f a) (fmap f b) (fmap f c)

--f
data TalkToMe a = Halt | Print String a | Read (String -> a)

instance Functor TalkToMe where
    fmap f Halt = Halt
    fmap f (Print x a) = Print x (f a)
    fmap f (Read g) = Read (f . g)

--exercitii monade curs 10 si 11
twiceWhenEven :: [Integer] -> [Integer]
twiceWhenEven xs = do
    x <- xs
    if even x
        then [x*x, x*x]
        else [x*x]


binding :: IO()
binding = do
    name <- getLine
    putStrLn "aaa"

radical :: Float -> Maybe Float
radical x
    | x >= 0 = return (sqrt x)
    | x < 0 = Nothing

altradical :: Float -> Either String Float
altradical x
    | x >= 0 = return (sqrt x)
    | x < 0 = Left "Nu avem radical oops"

--ce i asta??
newtype Writer log a = Writer {runWriter :: (a, log)}

tell :: log -> Writer log ()
tell msg = Writer ((), msg)




