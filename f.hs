{-# LANGUAGE GADTs #-}

data Tree a where
  Empty :: Tree a
  Branch :: Tree a -> a -> Tree a -> Tree a
  deriving (Show, Eq)

foo :: Tree String
foo = Branch (Branch (Branch Empty "Karsten" Empty) "Maik" (Branch Empty "Victor" Empty)) "Hi" Empty

bar :: Tree Integer
bar = Branch (Branch Empty 20 Empty) 10 (Branch Empty 5 Empty)

instance Functor Tree where
  -- fmap :: (a -> b) -> f a -> f b
  fmap f Empty          = Empty
  fmap f (Branch l v r) = Branch (fmap f l) (f v) (fmap f r)

-- foldable on the tree type
instance Foldable Tree where
  -- foldr :: (a -> b -> b) -> b -> t a -> b
  foldr _ z Empty                   = z
  foldr f z (Branch Empty v Empty)  = f v z
  foldr f z (Branch l v r)          = foldr f (f v (foldr f z r)) l

-- cata φ
cata :: (b -> a -> b -> b) -> b -> Tree a -> b
cata g z (Empty)        = z
cata g z (Branch l v r) = g v1 v2 v3 where
  v1 = cata g z l
  v2 = v
  v3 = cata g z r

  -- cata Branch Empty = id

cata' :: (a -> a -> a) -> a -> [a] -> a
cata' _ z []     = z
cata' f z (x:xs) = x `f` (cata' f z xs)

-- cata (:) [] = id
-- (+1) <$> [1,2,3]
