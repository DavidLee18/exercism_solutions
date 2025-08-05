module Anagram (anagramsFor) where
import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor t cs = [c | c <- cs, map toLower c /= map toLower t && sort (map toLower c) == sort (map toLower t)]
