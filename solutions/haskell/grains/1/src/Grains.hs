module Grains (square, total) where

import Data.Maybe (fromMaybe)

square :: Integer -> Maybe Integer
square n | n <= 0 || n > 64 = Nothing
square 1 = Just 1
square n = (2 *) <$> square (n-1)

total :: Integer
total = pow 2 64 - 1
  where pow x n | n <= 0 = 1
                | otherwise = x * pow x (n-1)