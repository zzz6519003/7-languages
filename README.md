#My walkthrough of the book 7-languages-in-7-weeks plus other la
nguage learning

## Gist
### OCaml

And you can mix all the kind of values:
let f = function
  | []                 -> failwith "empty list"
  | [| _; (_, x) |]::_ -> x
  | _                  -> failwith "the first array should be of size two"

# let f = function
#   | []                 -> failwith "empty list"
#   | [| _; (_, x) |]::_ -> x
#   | _                  -> failwith "the first array should be of size two"
# ;;
val f : ('a * 'b) array list -> 'b = <fun>


## Question

Instead of asking “how to do X in Elixir”, ask “how to solve Y in Elixir”. In other words, don’t ask how to implement a particular solution, instead describe the problem at hand. Stating the problem gives more context and less bias for a correct answer.
