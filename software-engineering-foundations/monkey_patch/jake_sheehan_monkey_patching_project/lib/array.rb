# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / self.length.to_f
    end

    def median
        return nil if self.empty?
        
        if self.length.odd?
            middle = self.length / 2
            return self.sort[middle]
        else
            middle_els = []
            middle_els << self.sort[(self.length / 2)]
            middle_els << self.sort[(self.length / 2) - 1]
            return middle_els.sum / 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |el| count[el] += 1 }
        count
    end

    def my_count(value)
        count = 0
        self.each { |item| count += 1 if item == value }
        count
    end

    def my_index(value)
        i = 0
        while i < self.length
            return i if self[i] == value
            i += 1
        end

        nil
    end

    def my_uniq
        new_arr = []
        self.each { |ele| new_arr << ele if !(new_arr.include?(ele)) }
        new_arr
    end

    def my_transpose
        height = self.length
        width = self[0].length
        new_arr = Array.new(height) {Array.new(width)}

        self.each_with_index do |row, row_idx|
            row.each_with_index do |num, col_idx|
                new_arr[col_idx][row_idx] = num
            end
        end

        new_arr
    end

end
