-- excercise 3

instance Functor (Either String) where
  -- fmap :: (a -> b) -> (Either String) a -> (Either String) b
  fmap f = 

instance Applicative (Either String) where
  -- pure :: a -> (Either String) a
  pure = undefined

  -- (<*>) :: (Either String) (a -> b) -> (Either String) a -> (Either String) b
  (<*>) = undefined

instance Monad (Either String) where
  -- return :: a -> (Either String) a
  return = undefined
  
  -- (>>=) :: Maybe a -> (a -> (Either String) b) -> (Either String) b
(>>=) = undefined
