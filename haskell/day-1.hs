-- Write a list comprehension to build a childhood multiplication table. The table would be a list of
-- three-tuples where the first two are integers from 1–12 and the third is the product of the first two.

mulTable = [(n1, n2, n1 * n2) | let nums = [1..12], n1 <- nums, n2 <- nums]

