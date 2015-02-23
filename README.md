Magic Squares problem
--

A magic square of size N is a square with the numbers from 1 to N ** 2 arranged
so that each row, column, and the two long diagonals have the same sum. For
example, a magic square for N = 5 could be:

    +------------------------+
    | 15 | 8 | 1 | 24 | 17 |
    +------------------------+
    | 16 | 14 | 7 | 5 | 23 |
    +------------------------+
    | 22 | 20 | 13 | 6 | 4 |
    +------------------------+
    | 3 | 21 | 19 | 12 | 10 |
    +------------------------+
    | 9 | 2 | 25 | 18 | 11 |
    +------------------------+

In this case the magic sum is 65. All rows, columns, and both diagonals add up
to that.

Files
--
 1. magic_square.rb - Actual code
 2. test_magic_square.rb - test cases for orders 3, 4, 6 and 5

Usage
--

To execute code:

    > ruby magic_square.rb <order as integer value>
    
    Examples:
    > ruby magic_square.rb 3
    > ruby magic_square.rb 4
    > ruby magic_square.rb 6

To run test cases:

    > ruby test_magic_square.rb

Note
==
Ruby version `2.1.5` used for testing.
