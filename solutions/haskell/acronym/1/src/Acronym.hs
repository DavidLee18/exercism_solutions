module Acronym (abbreviate) where
import Data.Char (isSpace, toUpper, isLower, isUpper)

abbreviate :: String -> String
abbreviate = map (toUpper . head) . splitPunc . splitCase
  where splitPunc [] = []
        splitPunc cs = es : splitPunc fs where
              (es, fs) = split' (not . isPunc) ds
              (_, ds) = split' isPunc cs
              isPunc c = isSpace c || c == '-' || c == '_'
              split' = split'' False
              split'' _ _ [] = ([], [])
              split'' b p [c] = if not b && p c then ([c], []) else ([], [c])
              split'' True p (c:c':cs) = ([], c:c':cs)
              split'' False p (c:c':cs) = if p c && p c' then (c:c':cs', cs'')
                else if p c && p c' == False then ([c], c':cs)
                else ([], c:c':cs) where (cs', cs'') = split'' False p cs
        splitCase [] = []
        splitCase [c] = [c]
        splitCase (c:c':cs) | isLower c && isUpper c' = c : ' ' : c' : splitCase cs
                            | otherwise = c : splitCase (c':cs)