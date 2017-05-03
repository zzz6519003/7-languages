-- • Write a function to find the product of a list of numbers.
product xs = 
  case xs of
    []     -> 1
    x::xs -> x * product xs

-- I’ll just mention that having this function would let us define factorial a little more cleanly than the example in the text.
fac n = product [1..n]



-- • Write a function to return all of the x fields from a list of point records.
allX ps = 
  case ps of
    []     -> []
    p::ps -> abs p.x :: allX ps
-- > allX [twoD, somePoint]
-- [5,5] : [number]

-- • Use records to describe a person containing name, age, and address. You
should also express the address as a record.


-- • Use records to describe a person containing name, age, and address. You
should also express the address as a record.
multiply x y  = x * y
multiplyBy6 y = multiply 6 y
-- > multiplyBy6 8
-- 48 : number
-- > 6*8
-- 48 : number

-- • Make a list of person records. Write a function to find all of the people in
your list older than 16.

addr = { street = "Cowley rd."
          , town   = "Oxford"
          , county = "Oxon."
          , pc     = "OX4 1DN"
          }

people =
  [ { name = "Edward Normalhands", age = 28,  address = addr }
  , { name = "Luke Landwalker",    age = 16,  address = addr }
  , { name = "Dave Vader",         age = 48,  address = addr }
  , { name = "Dan Solo",           age = 33,  address = addr }
  , { name = "Pizza the Hutt",     age = 164, address = addr }
  ]

oldies ps =
  case ps of
    []      -> []
    p::ps   -> if p.age > 16
                 then p :: oldies ps
               else oldies ps
               

oldies2 = filter (\p -> p.age > 16)

(map (.name))(oldies2 people )


-- • Write the same function, but allow records where the age field might be nothing. How does Elm support nil values?

import Html exposing (text)
import List exposing (..)

addr = { street = "Cowley rd." , town   = "Oxford" , county = "Oxon." , pc     = "OX4 1DN" }

people = 
  [ { name = "Edward Normalhands", age = Just 28,  address = addr }
  , { name = "Luke Landwalker",    age = Just 16,  address = addr }
  , { name = "Dave Vader",         age = Nothing,  address = addr }
  , { name = "Dan Solo",           age = Just 33,  address = addr }
  , { name = "Pizza the Hutt",     age = Just 164, address = addr }
  ]

oldies ps = 
  case ps of 
    []      -> []
    p::ps  -> case p.age of
                  Just n -> if n > 16 
                              then p :: oldies ps
                            else oldies ps
                  Nothing -> oldies ps

-- or for a simpler implementation with currying you could
oldies2 = filter (\p -> case p.age of
                              Just n  -> n > 16
                              Nothing -> False )

-- map (.name) (oldies people)
-- ["Edward Normalhands","Dan Solo","Pizza the Hutt"] : [String]
-- > map (.name) (oldies' people)
-- ["Edward Normalhands","Dan Solo","Pizza the Hutt"] : [String]
-- (map (.name))(oldies2 people )

main =
  text (toString (
    (map (.name))(oldies2 people )

    ))
