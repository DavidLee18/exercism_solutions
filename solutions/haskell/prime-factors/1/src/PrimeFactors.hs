module PrimeFactors (primeFactors) where

primeFactors :: Integer -> [Integer]
primeFactors n = case filter ((== 0) . (n `mod`)) $ takeWhile (\x -> fromInteger x <= (sqrt (fromInteger n)::Double)) $ primes [2 ..] of
  [] -> if n == 1 then [] else [n]
  (p : _) -> p : primeFactors (n `div` p)
  where
    primes [] = []
    primes (k : ks) = k : primes [j | j <- ks, j `mod` k /= 0]
