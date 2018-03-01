{-# LANGUAGE GADTs #-}
data Reader r a where
  MkReader :: (r -> a) -> Reader r a

-- r = Enviroment

instance Functor (Reader r) where
  -- fmap :: (a -> b) -> f a -> f b
  fmap f (MkReader g) = MkReader (f . g)

instance Applicative (Reader r) where
  pure = return


