{-# LANGUAGE GADTSyntax #-}

import Prelude hiding (Either(..), Maybe(..))

data Either l r where
  Left ::  l -> Either l r
  Right :: r -> Either l r


-- Either () Bool
-- Left ()
-- Right True
-- Right False
--
--
-- Maybe Bool
-- Nothing
-- Just True
-- Just False

data Maybe r where
  Nothing ::      Maybe   r
  Just    :: r -> Maybe   r

instance Functor (Maybe) where
  fmap f Nothing = Nothing
  fmap f (Just x) = Just (f x)

instance Functor (Either l) where
  -- fmap :: (a -> b) -> Either l a -> Either l b
  fmap f foo@(Left x) = foo
  fmap f   ~(Right x) = Right (f x)

instance Applicative (Either l) where
  -- pure :: a -> Either l a
  pure = return

  -- (<*>) :: Either l (a -> b) -> Either l a -> Either l b
  Left f <*> _ = Left f
  _ <*> Left v = Left v
  Right f <*> Right v = Right f v

instance Monad (Either l) where
  -- return :: a -> Either l a
  return = Right

  -- (>>=) :: Either l a -> (a -> Either l b) -> Either l b
  Left m >>= f = Left m
  Right m >>= f = f m
