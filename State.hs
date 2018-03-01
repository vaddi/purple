import Control.Monad

data Conf = Conf { factor    :: Int
                 , filePath  :: String
                 , threads   :: Int
                 }



data State s a = State { runState :: (s -> (a, s)) }

-- runState :: State s a -> (s -> (a, s))
--
-- 
--
--
instance Functor (State s) where
  -- fmap :: (a -> b) -> State s a     -> State s b
     fmap f (State r) = State $ \i -> (f . fst  . r $ i, i)
                -- r :: s -> (a, s)

instance Applicative (State s) where
    pure = return

    -- (<*>) :: State s (a -> b) -> State s a -> State s b
    State sf <*> State sv = State $ \s -> let
        (f, s') = sf s
        (v, s'') = sv s'
      in
        (f v, s'')

instance Monad (State s) where
    -- m ~ State s
    -- return :: a -> State s a
    return t = State $ \u -> (t ,u)

    -- (>>=) :: State s a -> (a -> State s b) -> State s b
    (State m) >>= kf = State $ \s -> let
        (q, s')     = m s
        (State w)   = kf q
      in
        w s'

put :: s -> State s ()
put x = State $ \_ -> ((), x)

get :: State s s
get = State $ \s -> (s, s)

modify :: (s -> s) -> State s ()
modify f = State $ \s -> ((), f s)

initial = [1,2,3]

push :: a -> State [a] ()
push x = modify (x:)

pop :: State [a] ()
pop = modify tail

game = do
  push 10
  xs <- get
  let xs' = (/2) <$> xs
  put xs
  return $ xs


-- 
