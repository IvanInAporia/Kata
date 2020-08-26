
int chop(int item, List<int> array)
{
    int location = -1;

    int length = array.length;

    if (length == 1)
    {
        if (array[0] == item)
        {
            location = 0;
        }
    }
    else if (length > 1)
    {
        int middle = (length / 2).floor();

        if (array[middle] == item)
        {
            location = middle;
        }
        else if (item < array[middle])
        {
            location = chop(item, array.sublist(0, middle));
        }
        else
        {
            location = chop(item, array.sublist(middle+1));

            if (location != -1)
            {
                location = location + middle + 1;
            }
        }
    }

    return location;
}

void main() {
    assert(-1 == chop(3, []));
    assert(-1 == chop(3, [1]));
    assert(0  == chop(1, [1]));
    assert(0  == chop(1, [1, 3, 5]));
    assert(1  == chop(3, [1, 3, 5]));
    assert(2  == chop(5, [1, 3, 5]));
    assert(-1 == chop(0, [1, 3, 5]));
    assert(-1 == chop(2, [1, 3, 5]));
    assert(-1 == chop(4, [1, 3, 5]));
    assert(-1 == chop(6, [1, 3, 5]));
    assert(0  == chop(1, [1, 3, 5, 7]));
    assert(1  == chop(3, [1, 3, 5, 7]));
    assert(2  == chop(5, [1, 3, 5, 7]));
    assert(3  == chop(7, [1, 3, 5, 7]));
    assert(-1 == chop(0, [1, 3, 5, 7]));
    assert(-1 == chop(2, [1, 3, 5, 7]));
    assert(-1 == chop(4, [1, 3, 5, 7]));
    assert(-1 == chop(6, [1, 3, 5, 7]));
    assert(-1 == chop(8, [1, 3, 5, 7]));

    print("Dart: PASS\n");
}