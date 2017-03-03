### Partial application

# let plus x y = x + y;;
val plus : int -> int -> int = <fun>
# plus 32 32;;
- : int = 64
# let incr = plus 1;;
val incr : int -> int = <fun>
# incr 32;;
- : int = 33

# let mul x y = x * y ;;
val mul : int -> int -> int = <fun>
# let double = mul 2;;
val double : int -> int = <fun>
# double 8;;
- : int = 16

### Pattern-matching on chars

Pattern-matching on characters is also possible, with a special syntax to denote character ranges:


