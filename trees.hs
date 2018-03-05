
-- data structure
data BTree a  = Leaf a
              | Branch (BTree a) (BTree a)

-- simple Tree's
b1,b2,b3 :: BTree Int
b1 = Leaf 10
b2 = Branch (Leaf 11) (Branch (Leaf 6) (Leaf 42))
b3 = Branch (Branch (Leaf 2) (Branch (Leaf 4) (Leaf 5))) (Branch (Leaf 5) (Branch (Branch (Leaf 3) (Leaf 1)) (Leaf 8)))

-- amount of leaf's of a tree
size :: BTree a -> Int
size (Leaf x) = 1
size (Branch xt yt) = size xt + size yt

-- amount of branches bettween root and top leaf
height :: BTree a -> Int
height (Leaf x) = 0
height (Branch xt yt) = 1 + max (height xt) (height yt)

-- folding a BTree
foldBTree :: (a -> b) -> (b -> b -> b) -> BTree a -> b
foldBTree f g (Leaf x) = f x
foldBTree f g (Branch xt yt) = g (foldBTree f g xt) (foldBTree f g yt)

-- size by fold BTree
size' = foldBTree (const 1) (+)

-- height by fold BTree
height' = foldBTree (const 0) maxubs
        where m `maxubs` n = 1 + m `max` n

-- transform a tree into a list
flatten :: BTree a -> [a]
flatten (Leaf x) = [x]
flatten (Branch xt yt) = flatten xt ++ flatten yt

mkBTree :: [a] -> BTree a
mkBTree xs
        | (m == 0) = Leaf (unwrap xs)
        | otherwise = Branch (mkBTree ys) (mkBTree zs)
        where m = (length xs) `div` 2
              (ys, zs) = splitAt m xs
              unwrap [x] = x



