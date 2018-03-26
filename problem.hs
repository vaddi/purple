import Data.List ((\\))

makeList :: String -> [Int]
makeList = fmap read .  unlines

main :: IO ()
main = do
  (a1:a2:as) <- getArgs
  str1 <- readFile a1
  str2 <- readFile a2
  print (makeList str1 \\ makeList str2)

  where
    diff :: String -> String -> [Int]
    diff l r = makeList l \\ makeList r
