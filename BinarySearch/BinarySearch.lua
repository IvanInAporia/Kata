-- binary search


function assert_equal(a, b)
    assert(a == b, "Expected: " .. a .. " got: " .. tostring(b))
end

function chop(item, array)
    local location = -1

    local lenght = #array

    if lenght == 1 then
        if array[1] == item then
            location = 1
        end
    elseif lenght > 1 then
        local middle = math.floor(lenght/2) + 1
        if array[middle] == item then
            location = middle
        elseif item < array[middle] then
            location = chop(item, table.pack(table.unpack(array, 1, middle - 1)))
        else
            location = chop(item, table.pack(table.unpack(array, middle + 1)))

            if location > 0 then
                location = location + middle
            end
        end
    end

    -- local pstr = ""
    -- for i,v in ipairs(array) do
    --     pstr = pstr .. " " .. v
    -- end
    -- print("chop:", pstr, "result:", location)

    return location
end

assert_equal(-1, chop(3, {}))
assert_equal(-1, chop(3, {1}))
assert_equal(0 + 1,  chop(1, {1}))

assert_equal(0 + 1,  chop(1, {1, 3, 5}))
assert_equal(1 + 1,  chop(3, {1, 3, 5}))
assert_equal(2 + 1,  chop(5, {1, 3, 5}))
assert_equal(-1, chop(0, {1, 3, 5}))
assert_equal(-1, chop(2, {1, 3, 5}))
assert_equal(-1, chop(4, {1, 3, 5}))
assert_equal(-1, chop(6, {1, 3, 5}))

assert_equal(0 + 1,  chop(1, {1, 3, 5, 7}))
assert_equal(1 + 1,  chop(3, {1, 3, 5, 7}))
assert_equal(2 + 1,  chop(5, {1, 3, 5, 7}))
assert_equal(3 + 1,  chop(7, {1, 3, 5, 7}))
assert_equal(-1, chop(0, {1, 3, 5, 7}))
assert_equal(-1, chop(2, {1, 3, 5, 7}))
assert_equal(-1, chop(4, {1, 3, 5, 7}))
assert_equal(-1, chop(6, {1, 3, 5, 7}))
assert_equal(-1, chop(8, {1, 3, 5, 7}))

print("Lua: PASS")
