module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear y = (y `mod` 400 == 0) || ((y `mod` 100 /= 0) && (y `mod` 4 == 0))
