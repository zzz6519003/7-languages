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

-- Function arguments are passed in parentheses.
-- Lowercase types are type variables: they can be any type, as long as each
-- call is consistent.
List.map : (a -> b) -> List a -> List b
-- "List dot map has type a-goes-to-b, goes to list of a, goes to list of b."

-- There are three special lowercase types: number, comparable, and appendable.
-- Numbers allow you to use arithmetic on Ints and Floats.
-- Comparable allows you to order numbers and strings, like a < b.
-- Appendable things can be combined with a ++ b.

{-- Type Aliases and Union Types --}

-- When you write a record or tuple, its type already exists.
-- (Notice that record types use colon and record values use equals.)
origin : { x : Float, y : Float, z : Float }
origin =
  { x = 0, y = 0, z = 0 }

-- You can give existing types a nice name with a type alias.
type alias Point3D =
  { x : Float, y : Float, z : Float }

-- If you alias a record, you can use the name as a constructor function.
otherOrigin : Point3D
otherOrigin =
  Point3D 0 0 0

-- But it's still the same type, so you can equate them.
origin == otherOrigin -- True

-- By contrast, defining a union type creates a type that didn't exist before.
-- A union type is so called because it can be one of many possibilities.
-- Each of the possibilities is represented as a "tag".
type Direction =
  North | South | East | West

-- Tags can carry other values of known type. This can work recursively.
type IntTree =
  Leaf | Node Int IntTree IntTree
-- "Leaf" and "Node" are the tags. Everything following a tag is a type.


