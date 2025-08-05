module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA [] = Right []
toRNA ('A':cs) = ('U':) <$> toRNA cs
toRNA ('C':cs) = ('G':) <$> toRNA cs
toRNA ('G':cs) = ('C':) <$> toRNA cs
toRNA ('T':cs) = ('A':) <$> toRNA cs
toRNA (c:_) = Left c