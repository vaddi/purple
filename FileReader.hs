import System.IO
import System.Environment

main :: IO ()
main = do 
  args <- getArgs
  handle <- openFile (args !! 0) ReadMode
  contents <- hGetContents handle
  putStr (show $ lineCount contents)

lineCount :: String -> Int
lineCount = len . lines

len :: [a] -> Int
len []    = 0
len (x:s) = 1 + len xs





