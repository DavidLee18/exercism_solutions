module ReverseString (reverseString) where

reverseString :: String -> String
reverseString = rev' []
  where rev' s [] = s
        rev' s (c:cs) = rev' (c:s) cs