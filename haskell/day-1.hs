-- Write a list comprehension to build a childhood multiplication table. The table would be a list of
-- three-tuples where the first two are integers from 1–12 and the third is the product of the first two.

mulTable = [(n1, n2, n1 * n2) | let nums = [1..12], n1 <- nums, n2 <- nums]

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



-- Write a function that builds two-tuples with all possible combinations of two of the colors black,
-- white, blue, yellow, and red. Note that you should include only one of (black, blue) and (blue, black).

colorList :: [([Char], [Char])]
colorList = [(a, b) | let colors = ["black", "white", "blue", "yellow", "red"], a <- colors, b <- colors, a < b]

