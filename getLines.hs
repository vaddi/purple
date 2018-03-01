import System.IO
import System.Environment

-- allows to explicitly specify the universal quantification in polymorphic type signatures
--{-# LANGUAGE ExpliciteForall#-}



-- simple "hello world"
greet :: IO String
greet = do
  a <- getLine
  putStr $ "Hi " ++ a
  getLine


--type Age = Int

--data Maybe' a = Just' a
--              | Nothing'

--instance (Show a) => Show (Maybe' a) where
--    show Nothing'  = "Nothing'"
--    show (Just' x) = "Just' " ++ show x

--instance Functor Maybe' where
--    -- fmap :: (a -> b) -> Maybe' a -> Maybe' b
--    fmap f m = 

--instance (Eq a) => Eq (Maybe' a) where
--    (==) Nothing' Nothing'   = True
--    (==) (Just' l) (Just' r) = l == r
--    (==) _        _          = False

--Int * () ~~~ Int

--(Int, ()) ~~~ Int

--askAge :: IO Nothingness
--askAge = putStr "What is your age?" >>
--         getLine                    >>= \line ->
--         putStr "Thank you, " ++ line





-- function composition
--(.) :: (b -> c) -> (a -> b) -> (a -> c)
--f . g   = \x -> f (g x)
--(.) f g = ...

-- const (constant function)
--foo :: a -> b -> a
--foo x y = x

-- take first 2 arguments and return in reversed order
-- flip
-- flip :: (a -> b -> c) -> b -> a -> c
-- flip f b a = f a b

-- read a file and count lines
main :: IO ()
main = do
    args <- getArgs
    handle <- openFile (args !! 0) ReadMode
    contents <- hGetContents handle
    putStr (show $ lineCount contents)

-- line count helper funktion
lineCount :: String -> Int
lineCount = len . lines

-- lenght of a list
len :: [a] -> Int
len []     = 0
len (x:xs) = 1 + len xs

-- first element of a list
head' :: [a] -> Maybe a
head' []     = Nothing
head' (x:xs) = Just x

-- exclude the first element of a list
tail' :: [a] -> Maybe [a]
tail' []     = Nothing
tail' (x:xs) = Just xs

-- exclude the last element of a list
init' :: [a] -> [a]
init' [x]    = []
init' (x:xs) = x : (init' xs)

-- reverse all elements of a list
reverse' :: [a] -> [a]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]

-- the sum of all list elements
sum' :: [Int] -> Int
sum' []     = 0
sum' (x:xs) = x + sum' xs

-- product of all list elements 
prod :: [Int] -> Int
prod []     = 1
prod (x:xs) = x * prod xs

-- infinite list
cycleList :: [a] -> [a]
cycleList liste = liste ++ cycleList liste

-- take n elements of a list
take' :: Int -> [a] -> [a]
take' n _      | n <= 0 = []
take' _ []              = []
take' n (x:xs)          = x : take' (n - 1) xs

--take' 2 (1:(2:(3:[]))) = 1 : (take' (2 - 1) (2:(3:[])))
--                       = 1 : (take' 1        2:(3:[]))
--                       = 1 : (2 : ( take' (1 - 1) 3:[] ))
--                       = 1 : (2 : ( take'    0    3:[] ))
--                       = 1 : (2 : ( 3 :  take' (0 - 1) []))
--                       = 1 : (2 : ( 3 : ([] : take '1 (-1) take' (0 - 1) []))

-- drop n elements of a list
drop' :: Int -> [a] -> [a]
drop' n xs      | n <= 0 = xs
drop' _ []              = []
drop' n (_:xs)          = drop' (n - 1) xs

-- Takes elements until the predicate fails. 
--dropWhile' :: (a -> Bool) -> [a] -> [a]
--dropWhile' f xs = 

-- Drops elements until the predicate fails.
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ []           = []
takeWhile' p (x:xs)
             | p x        = x : takeWhile p xs
             | otherwise  = []

--boolEquals Bool -> Bool -> Bool
--boolEquals True True   = True
--boolEquals False False = True
--boolEquals _     _     = False

-- create a class Eq 
--class Eq a whee
--    (==) :: a -> a -> Bool

-- data structure binary tree
--data Node a = Leaf a | Branch (Node a) (Node a) deriving (Eq, Ord, Show)

-- filter a list by given predicat 
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ []          = []
filter' p (x:xs)
        | p x         = x : filter' p xs
        | otherwise   = filter' p xs


-- split List in chunks of a given size
inChunksOf :: Int -> [a] -> [[a]]
inChunksOf _ []     = []
inChunksOf n xs = take' n xs : inChunksOf n (drop' n xs)

-- fmap for []
map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (x:xs) = f x : map' f xs

-- fmap' :: (a -> b) -> f a -> f b
-- fmap' _ []    = []
-- fmap' f  

--
-- flip example
--

--flip :: (a -> b -> c) -> b -> a -> c
--        (a -> b' ...)
--        (a -> a)

--b' ~ (b -> c)
--a ~ b'
--1
--a ~ (b -> c)

--flip :: ((b -> c) -> (b -> c)) -> b -> (b -> c) -> c
--id ::    a        -> a


-- function composition
--(.)             :: (b -> c) -> (a             -> b)             -> a -> c
--(.) . (.)       :: (b -> c) -> (a1       -> a -> b)       -> a1 -> a -> c

--(.:) = (.) . (.)
--(.::::::::::::::::::::)
--comp10

