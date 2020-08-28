import Control.Exception

chop :: Int -> [Int] -> Int
chop item array | length array < 1  = -1
                | length array == 1 = if (head array) == item then 0 else -1
                | length array > 1  = left_and_right item array ((length array) `div` 2)

left_and_right :: Int -> [Int] -> Int -> Int
left_and_right item array middle | (array !! middle) == item = middle
                                 | item < (array !! middle)  = chop item (take middle array)
                                 | item >= (array !! middle) = adjust_if_found (chop item (drop middle array)) middle

adjust_if_found :: Int -> Int -> Int
adjust_if_found location middle = if location >= 0 then location + middle else location

main = do
    assert (-1 == (chop 3 [])) putStr ""
    assert (-1 == (chop 3 [1])) putStr ""
    assert (0  == (chop 1 [1])) putStr ""
    assert (0  == (chop 1 [1, 3, 5])) putStr ""
    assert (1  == (chop 3 [1, 3, 5])) putStr ""
    assert (2  == (chop 5 [1, 3, 5])) putStr ""
    assert (-1 == (chop 0 [1, 3, 5])) putStr ""
    assert (-1 == (chop 2 [1, 3, 5])) putStr ""
    assert (-1 == (chop 4 [1, 3, 5])) putStr ""
    assert (-1 == (chop 6 [1, 3, 5])) putStr ""
    assert (0  == (chop 1 [1, 3, 5, 7])) putStr ""
    assert (1  == (chop 3 [1, 3, 5, 7])) putStr ""
    assert (2  == (chop 5 [1, 3, 5, 7])) putStr ""
    assert (3  == (chop 7 [1, 3, 5, 7])) putStr ""
    assert (-1 == (chop 0 [1, 3, 5, 7])) putStr ""
    assert (-1 == (chop 2 [1, 3, 5, 7])) putStr ""
    assert (-1 == (chop 4 [1, 3, 5, 7])) putStr ""
    assert (-1 == (chop 6 [1, 3, 5, 7])) putStr ""
    assert (-1 == (chop 8 [1, 3, 5, 7])) putStr ""
    print "Haskell: PASS"

