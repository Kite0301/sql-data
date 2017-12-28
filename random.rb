def get_random_index(array)
  total_weight = array.inject(:+)
  value = rand(total_weight) + 1
  retIndex = nil

  array.size.times do |i|
    if array[i] >= value
      retIndex = i
      break
    end
    value -= array[i]
  end

  return retIndex
end

list = [1, 1, 1, 1, 1, 3, 4, 5, 6, 6, 7, 8, 9, 9, 10, 10, 10, 9, 9, 8, 8, 7, 7, 7, 7, 6, 6, 6, 5, 4, 4, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1]
count = Array.new(list.size, 0)
500.times do |i|
  count[get_random_index(list)] += 1
end
puts count

# array = [
#   1,
#   1,
#   1,
#   1,
#   1,
#   3,
#   4,
#   5,
#   6,
#   6,
#   7,
#   8,
#   9,
#   9,
#   10,
#   11,
#   10,
#   10,
#   9,
#   9,
#   8,
#   8,
#   8,
#   7,
#   7,
#   6,
#   6,
#   6,
#   5,
#   4,
#   4,
#   3,
#   3,
#   2,
#   2,
#   2,
#   2,
#   2,
#   2,
#   2,
#   2,
#   2,
#   2,
#   2,
#   2,
#   2,
#   1,
#   1,
#   1,
#   1,
#   1,
#   1,
#   1,
#   1,
#   1,
# ]
