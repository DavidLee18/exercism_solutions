module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ foldl merge [] $ map multiples factors
  where multiples n = multiples' n n
        multiples' m n | n >= limit || n == 0 = []
                       | otherwise = n : multiples' m (m + n)
        merge [] xs = xs
        merge xs [] = xs
        merge xs@(x:xs') ys@(y:ys') | x < y = x : merge xs' ys
                                    | x == y = x : merge xs' ys'
                                    | otherwise = y : merge xs ys'