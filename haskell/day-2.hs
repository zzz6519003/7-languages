-- Write a sort that takes a list and returns a sorted list.
module MySort where
import Data.Ord

my_sort [] = []
my_sort (x:xs) = my_insert x $ my_sort xs
  where my_insert x [] = [x]
        my_insert x (y:ys) | x > y        = y:my_insert x ys
                           | otherwise    = x:y:ys

-- Write a sort that takes a list and returns a sorted list.

sortList :: [Integer] -> [Integer]
sortList [] = []
sortList (h:t) = insert h (sortList t)
  where
  insert i [] = [i]
  insert i (sh:st) = if (i < sh) then i:sh:st else sh:(insert i st)

-- Write a sort that takes a list and returns a sorted list.

sort [] = []
sort (pivot:rest) = sort smaller ++ [pivot] ++ sort greater
where
    smaller = filter (\x -> x < pivot) rest
    greater = filter (\x -> x >= pivot) rest

sortListBy fun [] = []
sortListBy fun (h:t) = insert fun h (sortListBy fun t)
  where
  insert fun i [] = [i]
  insert fun i (sh:st) = if (fun i sh) then i:sh:st else sh:(insert fun i st)

-- Write a sort that takes a list and a function that compares its two arguments and then returns a sorted list.

-- Use a partially applied function to define a function that will
-- return half of a number and another that will append \n to the
-- end of any string.


-- Define our module.
module Maine where


    -- Curry the division operator with 2. This means that anything
    -- passed to the halfzies function will be divided by 2.
    halfzies = (/ 2)


    -- Curry the ++ oprator to append the "\n" to any string.
    newLine = (++ "\n")

-- Write a function that takes an argument x and returns a lazy
-- sequence that has every third number, starting with x. Then,
-- write a function that includes every fifth number, beginning
-- with y. Combine these two functions through composition to
-- return every eigth number, beginning with x + y.


-- Define our module.
module Maine where


    -- I return an infinite range starting at X and then
    -- selecting every 3rd valud after that.
    every3rd x = [x, (x + 3) ..]


    -- I return an infinite range starting a Y and then
    -- selecting every 5th value after that.
    every5th y = [y, (y + 5) ..]


    -- For our "8th" version, we are going to take the result
    -- of both our 3rd and 5th lists and then zip them together,
    -- adding each value to the other.
    every8th x y =
        (zipWith (+) (every3rd x) (every5th y))
module Lazy where

thirds x = [x, x+3..]
fifths x = [x, x+5..]
eighths x y = zipWith (+) (thirds x) (fifths y)
Testing:

*Lazy> take 10 $ thirds 10
[10,13,16,19,22,25,28,31,34,37]
*Lazy> take 10 $ fifths 20
[20,25,30,35,40,45,50,55,60,65]
*Lazy> take 10 $ eighths 10 20
[30,38,46,54,62,70,78,86,94,102]


-- Write a function to determine the greatest common denominator of two integers.
module GCD where

-- Euclidean algorithm
my_gcd m n | m < n     = my_gcd n m
           | n == 0    = m
           | otherwise = my_gcd (m-n) n

