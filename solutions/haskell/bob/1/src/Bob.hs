module Bob (responseFor) where

responseFor :: String -> String
responseFor s | all' isUpper (filter isAlpha s) && last' s == Just '?' = "Calm down, I know what I'm doing!"
              | all' isUpper (filter isAlpha s) = "Whoa, chill out!"
              | last' (filter (not . isSpace) s) == Just '?' = "Sure."
              | all' isSpace s || s == [] = "Fine. Be that way!"
              | otherwise = "Whatever."
  where last' [] = Nothing
        last' [c] = Just c
        last' (c:cs) = last' cs
        isUpper = flip elem "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        isLower = flip elem "abcdefghijklmnopqrstuvwxyz"
        isAlpha = (||) <$> isUpper <*> isLower
        isSpace c = c == ' ' || c == '\t' || c == '\n' || c == '\r' || c == '\f' || c == '\v'
        all' _ [] = False
        all' f [c] | f c = True
                   | otherwise = False
        all' f (c:cs) = f c && all' f cs