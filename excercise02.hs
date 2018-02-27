-- lesson 02
-- Lists

instance Functor [] where
  -- fmap :: (a -> b) -> [a] -> [b]
  fmap f []     = []
  fmap f (x:xs) = f x : fmap f xs

--instance Applicative [] where
--  -- pure :: a -> [a]
--  pure x = x : []
--  
--  -- (<*>) :: [(a -> b)] -> [a] -> [b]
--  [] <*> _  = []
--  _  <*> [] = []
--  af <*> av = 


instance Monad [] where
    
