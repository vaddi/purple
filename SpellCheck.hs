import System.Environment
import Control.Monad
import Data.Set

--dict = "/usr/share/dict/words"

-- Print out all Words which are not found in the Dictonary file
main = do
  [s] <- getArgs
  f   <- readFile "/usr/share/dict/words"
--  f   <- readFile dict
  g   <- readFile s
  let dict = fromList (lines f)
  mapM_ (spell dict) (words g)

spell d w = when (w `notMember` d) (putStrLn w)

