module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz i | i <= 0 = Nothing
collatz 1 = Just 0
collatz n | even n = (1 +) <$> collatz (n `div` 2)
          | otherwise = (1 +) <$> collatz (3 * n + 1)