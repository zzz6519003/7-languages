-- The empty tuple, or "unit", is sometimes used as a placeholder.
-- It is the only value of its type, also called "Unit".
()

-- Functions can be recursive.
fib n =
  if n < 2 then
    1
  else
    fib (n - 1) + fib (n - 2)

List.map fib (List.range 0 8) -- [1, 1, 2, 3, 5, 8, 13, 21, 34]

