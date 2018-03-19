-- simple interact sample
-- https://wiki.haskell.org/Tutorials/Programming_Haskell/String_IO
--
-- Signature of interact
-- interact :: (String -> String) -> IO ()
--
-- Signature of id
-- id :: a -> a

-- like unix cat
-- compile: ghc -O Interact.hs
-- run: cat Interact | ./Interact
--main = interact id

-- like unix wc (count words)
-- run: runhaskell Interact.hs < Interact.hs  
--main    = interact count
--count s = show (length s) ++ "\n"

-- like unix wc (count lines)
--main = interact (count . lines)
--count s = show (length s) ++ "\n"

-- like unix rev (reverse lines)
-- run: ./Interact 
main = interact (unlines . map reverse . lines)

