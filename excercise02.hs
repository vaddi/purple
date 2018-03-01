-- lesson 02
-- Lists

instance Functor [] where
  -- fmap :: (a -> b) -> [a] -> [b]
  fmap f []     = []
  fmap f (x:xs) = f x : fmap f xs

instance Applicative [] where
  -- pure :: a -> [a]
  pure x = [x]

  -- (<*>) :: [(a -> b)] -> [a] -> [b]
  [] <*> _  = []
  _  <*> [] = []
  af <*> av = undefined

instance Monad [] where
    -- return :: a -> m a
    return x = [x]

    -- (>>=) :: [t] -> (t -> [u]) -> [u]
    xs >>= f = concat (fmap f xs)
    _  >>= _ = []



    -- fmap ::         (a -> b) -> [a] -> [b]
-- cata :: (a -> a -> a) -> 
-- cata f t []     = t
-- cata f t (x:xs) = f x (cata f t xs)
-- 
-- concat = foldlr (++) []


