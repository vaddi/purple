{-# LANGUAGE GADTs #-}

import Prelude hiding (Maybe(..))
-- Simple aliasing
--type Age = Int

-- creates a new Type without any functions
-- newType Age = Int ?

-- Functor        :: (* -> *) -> Constraint
-- Applicative    :: (* -> *) -> Constraint
-- Monad          :: (* -> *) -> Constraint

-- Int            :: *
-- String         :: *
-- Bool           :: *
-- []             :: * -> *
-- [Int]             *

-- instance type typeparameter where (type constructor(s))

-- define a datatype
--   datatype    constructor (is a special function)
data Maybe a where 
  Just    :: a -> Maybe a
  Nothing :: Maybe a
  deriving (Show)

-- instance name datatype (use of type constructor of datatype)
instance Functor Maybe where
    -- fmap :: (t -> u) -> Maybe t -> Maybe u
    fmap f (Just x)  = Just (f x)
    fmap f (Nothing) = Nothing

instance Applicative Maybe where
    -- pure :: a -> Maybe a
    pure x = Just x

    -- (<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
    Just f <*> Just x = Just (f x)
    _      <*> _      = Nothing

instance Monad Maybe where
    return = pure

    -- (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
    Just x  >>= f = f x
    Nothing >>= f = Nothing

Just “hi” :: Maybe String

Nothing :: Maybe a

half :: (Num a) => a -> Maybe a
half x = if x `mod` 2 == 0 then
         Just (x `div` 2) else
         Nothing


