-- Write a function that takes a list and returns the same list in reverse.

reverseList :: [Integer] -> [Integer]
reverseList [] = []
reverseList (h:t) = reverseList t ++ [h]

-- How many different ways can you find to write allEven?
allEven :: [Integer] -> [Integer]
allEven [] = []
allEven (h:t) = if even h then h:allEven t else allEven t

allEven2 :: [Integer] -> [Integer]
allEven2 list
  | list == [] = []
  | even (head list) = (head list):allEven2(tail list)
  | otherwise = allEven2(tail list)

allEven3 :: [Integer] -> [Integer]
allEven3 list = [e | e <- list, even e]

allEven4 :: [Integer] -> [Integer]
allEven4 list = filter (\x -> even x) list

