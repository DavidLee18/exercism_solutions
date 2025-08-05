module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = setClock $ hour * 60 + min

toString :: Clock -> String
toString (Clock m) = showPad h ++ ":" ++ showPad min
  where (h, min) = m `divMod` 60
        showPad t | t < 10 = '0':show t
                  | otherwise = show t

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min (Clock m) = setClock $ m + hour * 60 + min

setClock m | m < 0 = setClock $ m + 60*24
           | m >= 60*24 = setClock $ m - 60*24
           | otherwise = Clock m
