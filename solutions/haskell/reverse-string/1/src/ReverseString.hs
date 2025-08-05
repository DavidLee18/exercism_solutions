module ReverseString (reverseString) where

reverseString :: String -> String
reverseString [] = []
reverseString (c:cs) = reverseString cs ++ [c]
