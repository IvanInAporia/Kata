
fn chop(item: i32, array: &[i32]) -> i32 {
    let mut location = -1;

    if array.len() == 1
    {
        if array[0] == item
        {
            location = 0;
        }
    }
    else if array.len() > 1
    {
        let middle = (array.len() / 2) as usize;

        if array[middle] == item
        {
            location = middle as i32;
        }
        else if item < array[middle]
        {
            location = chop(item, &array[.. middle]);
        }
        else
        {
            location = chop(item, &array[middle+1 ..]);

            if location != -1
            {
                location = location + (middle + 1) as i32;
            }
        }
    }

    return location;
}

fn main() {
    assert_eq!(-1, chop(3, &[]));
    assert_eq!(-1, chop(3, &[1]));
    assert_eq!(0 , chop(1, &[1]));
    assert_eq!(1 , chop(3, &[1, 3, 5]));
    assert_eq!(0 , chop(1, &[1, 3, 5]));
    assert_eq!(2 , chop(5, &[1, 3, 5]));
    assert_eq!(-1, chop(0, &[1, 3, 5]));
    assert_eq!(-1, chop(2, &[1, 3, 5]));
    assert_eq!(-1, chop(4, &[1, 3, 5]));
    assert_eq!(-1, chop(6, &[1, 3, 5]));
    assert_eq!(0 , chop(1, &[1, 3, 5, 7]));
    assert_eq!(1 , chop(3, &[1, 3, 5, 7]));
    assert_eq!(2 , chop(5, &[1, 3, 5, 7]));
    assert_eq!(3 , chop(7, &[1, 3, 5, 7]));
    assert_eq!(-1, chop(0, &[1, 3, 5, 7]));
    assert_eq!(-1, chop(2, &[1, 3, 5, 7]));
    assert_eq!(-1, chop(4, &[1, 3, 5, 7]));
    assert_eq!(-1, chop(6, &[1, 3, 5, 7]));
    assert_eq!(-1, chop(8, &[1, 3, 5, 7]));

    println!("Rust: Binary Search PASS");
}