package main

import "fmt"
import "runtime"

func chop(item int, arr []int) int {
	location := -1

	if len(arr) == 1 {
		if (arr[0] == item) {
			location = 0
		}
	} else if len(arr) > 1 {
		middle := len(arr) / 2

		if (arr[middle] == item) {
			location = middle
		} else if item < arr[middle] {
			location = chop(item, arr[:middle])
		} else {
			location = chop(item, arr[middle + 1:])

			if location != -1 {
				location = location + middle + 1
			}
		}
	}

	return location;
}

func CheckResult(expected int, got int) {
	if expected != got {
        // notice that we're using 1, so it will actually log where
        // the error happened, 0 = this function, we don't want that.
        _, fn, line, _ := runtime.Caller(1)
        panic(fmt.Sprintf("[FAIL TEST] %s:%d expected %d, got %d", fn, line, expected, got))
    }
}

func main() {
    CheckResult(-1, chop(3, []int{}))
    CheckResult(-1, chop(3, []int{1}));
    CheckResult(0 , chop(1, []int{1}));
    CheckResult(0 , chop(1, []int{1, 3, 5}));
    CheckResult(1 , chop(3, []int{1, 3, 5}));
    CheckResult(2 , chop(5, []int{1, 3, 5}));
    CheckResult(-1, chop(0, []int{1, 3, 5}));
    CheckResult(-1, chop(2, []int{1, 3, 5}));
    CheckResult(-1, chop(4, []int{1, 3, 5}));
    CheckResult(-1, chop(6, []int{1, 3, 5}));
    CheckResult(0 , chop(1, []int{1, 3, 5, 7}));
    CheckResult(1 , chop(3, []int{1, 3, 5, 7}));
    CheckResult(2 , chop(5, []int{1, 3, 5, 7}));
    CheckResult(3 , chop(7, []int{1, 3, 5, 7}));
    CheckResult(-1, chop(0, []int{1, 3, 5, 7}));
    CheckResult(-1, chop(2, []int{1, 3, 5, 7}));
    CheckResult(-1, chop(4, []int{1, 3, 5, 7}));
    CheckResult(-1, chop(6, []int{1, 3, 5, 7}));
    CheckResult(-1, chop(8, []int{1, 3, 5, 7}));

    fmt.Printf("Go: PASS\n")
}