-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- (.) f g x = f (g x)

-- (.) = compose, "after", "nach"
--
--
-- f . g
--
-- (f . g) 5
--
-- f . g $ 5
--

--(.) f g x = f (g x)
--
--(.) f = \g x -> f (g x)
--
--f . g = \x -> f (g x)


--f $ g 5
--f (g 5)
--(f . g) 5
--f . g $ 5


--f $ g $ h $ i $ 5
--f (g (h (i 5)))
--
--(f . g . h . i) 5

-- upcase (head (unword (fst ("bla foo bar", 10))))




--transformData dataSet = firstWord pair where
--  pair = head dataSet
--  firstWord = head . unword . fst
