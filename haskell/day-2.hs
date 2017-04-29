
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

