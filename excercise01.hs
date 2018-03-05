instance Functor Maybe where
  -- fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap f (Just x)   = Just (f x)
  fmap f (Nothing)  = Nothing


instance Applicative Maybe where
  -- return :: a -> Maybe a
  pure = return

  -- (<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
  Just f <*> Just x = Just (f x)
  _      <*> _      = Nothing


instance Monad Maybe where
  -- m ~ Maybe
  -- return :: a -> Maybe a
  return x = Just x

  -- (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
  Just x >>= f Just x  = Just x
  _      >>= _        = Nothing


