module DNA (nucleotideCounts, Nucleotide(..)) where

import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map.Map Nucleotide Int)
nucleotideCounts [] = Right Map.empty
nucleotideCounts ('A':cs) = (Map.insertWith (+) A 1) <$> nucleotideCounts cs
nucleotideCounts ('C':cs) = (Map.insertWith (+) C 1) <$> nucleotideCounts cs
nucleotideCounts ('G':cs) = (Map.insertWith (+) G 1) <$> nucleotideCounts cs
nucleotideCounts ('T':cs) = (Map.insertWith (+) T 1) <$> nucleotideCounts cs
nucleotideCounts (c:_) = Left $ "unknown letter " ++ show c