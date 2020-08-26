#include <stdio.h>
#include <assert.h>

int chop(int item, int * array, int len)
{
    int location = -1;
    if (len == 1)
    {
        if (array[0] == item)
        {
            return 0;
        }
    }
    else if (len > 1)
    {
        int middle = len / 2;

        if (array[middle] == item)
        {
            location = middle;
        }
        else if (item < array[middle])
        {
            location = chop(item, array, middle);
        }
        else if ((middle+1) < len)
        {
            location = chop(item, &array[middle+1], len - middle - 1);

            if (location != -1)
            {
                location += (middle + 1);
            }
        }
    }

    return location;
}

int main()
{
    //assert(-1 == chop(3, (int*){}));
    assert(-1 == chop(3, (int[]){1}, 1));
    assert(0  == chop(1, (int[]){1}, 1));
    assert(0  == chop(1, (int[]){1, 3, 5}, 3));
    assert(1  == chop(3, (int[]){1, 3, 5}, 3));
    assert(2  == chop(5, (int[]){1, 3, 5}, 3));
    assert(-1 == chop(0, (int[]){1, 3, 5}, 3));
    assert(-1 == chop(2, (int[]){1, 3, 5}, 3));
    assert(-1 == chop(4, (int[]){1, 3, 5}, 3));
    assert(-1 == chop(6, (int[]){1, 3, 5}, 3));
    assert(0  == chop(1, (int[]){1, 3, 5, 7}, 4));
    assert(1  == chop(3, (int[]){1, 3, 5, 7}, 4));
    assert(2  == chop(5, (int[]){1, 3, 5, 7}, 4));
    assert(3  == chop(7, (int[]){1, 3, 5, 7}, 4));
    assert(-1 == chop(0, (int[]){1, 3, 5, 7}, 4));
    assert(-1 == chop(2, (int[]){1, 3, 5, 7}, 4));
    assert(-1 == chop(4, (int[]){1, 3, 5, 7}, 4));
    assert(-1 == chop(6, (int[]){1, 3, 5, 7}, 4));
    assert(-1 == chop(8, (int[]){1, 3, 5, 7}, 4));

    printf("C: PASS\n");
    return 0;
}