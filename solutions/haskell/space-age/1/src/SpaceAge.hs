module SpaceAge (Planet(..), ageOn, year) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = (seconds / 31557600) / (year planet)

year :: Planet -> Float
year Mercury = 0.2408467
year Venus = 0.61519726
year Earth = 1.0
year Mars = 1.8808158
year Jupiter = 11.862615
year Saturn = 29.447498
year Uranus = 84.016846
year Neptune = 164.79132
