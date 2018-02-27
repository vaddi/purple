instance Functor Maybe where
  -- fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap f (Just x)   = Just (f x)
  fmap f (Nothing)  = Nothing

instance Applicative Maybe where
  -- pure a -> Mabe a 
  pure x = Just x

  -- (<*>) :: Maybe (a -> b) -> Maybe a Maybe b
  Just f <*> Just x = Just (f x)
  _      <*> _      = Nothing


-- Applicative Functors (Monads)
instance Monad Maybe where
  -- (like pure from Applicative)
  -- return :: a -> m a
  return x = Just x 
  
  -- (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
  Just x >>= f Just x  = Just x
  _      >>= _        = Nothing


