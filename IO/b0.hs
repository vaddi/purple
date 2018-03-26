-- put this in file b0.hs, compile and run, enter a line
main :: IO ()
main = getLine
       >>=
       putStrLn
