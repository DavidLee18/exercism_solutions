module Pangram (isPangram) where

import Data.Char (toUpper, toLower)

isPangram = flip isPangram' "abcdefghijklmnopqrstuvwxyz"

isPangram' :: String -> String -> Bool
isPangram' [] "" = True
isPangram' [] _ = False
isPangram' (c:cs) s | elem c' s = isPangram' cs (filter (/=c') s)
                    | otherwise = isPangram' cs s
                    where c' = toLower c