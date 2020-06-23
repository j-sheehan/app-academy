array = [2, 8, 5, 2, 6, 3, 9, 2, 6, 5]

def bubble_sort(arr)
    swap = true
    until !swap
        swap = false
        (0...arr.length - 1).each do |i|
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swap = true
            end
        end
    end

    arr
end

p bubble_sort(array)