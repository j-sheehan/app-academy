array = [2, 8, 5, 2, 6, 3, 9, 2, 6, 5]

def bubble_sort(arr)
    swap = true
    until !swap
        swap = false
        i = 0
        j = i + 1
        while j < arr.length
            if arr[i] > arr[j]
                arr[i], arr[j] = arr[j], arr[i]
                swap = true
            end
            i += 1
            j += 1
        end
    end

    arr
end

p bubble_sort(array)