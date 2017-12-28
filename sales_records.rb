def get_user_id
  array = Array.new(325)
  325.times do |i|
    if (i % 31 == 0)
      array[i] = 4
    elsif (i % 7 == 0)
      array[i] = 3
    elsif (i % 3 == 0)
      array[i] = 2
    elsif (i % 23 == 0)
      array[i] = 0
    else
      array[i] = 1
    end
  end
  get_random_index(array) + 1
end

def get_product_id
  array = Array.new(30)
  30.times do |i|
    array[i] = \
      case i + 1
      when 11
        6
      when 3, 24
        5
      when 1, 7, 15, 26
        4
      when 9, 12, 16, 17, 19, 25, 28, 30
        3
      when 13, 22
        1
      else
        2
      end
  end
  get_random_index(array) + 1
end

def get_created_at
  array = Array.new(31)
  31.times do |i|
    array[i] = ((i + 3) / 10) + 1
  end
  index = get_random_index(array) + 1
  return "2017-07-#{index.to_s.rjust(2, '0')}"
end

def get_age
  array = [1, 1, 3, 4, 5, 6, 7, 8, 9, 9, 10, 11, 11, 10, 10, 9, 9, 9, 8, 8, 8, 7, 7, 6, 6, 5, 4, 4, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  get_random_index(array) + 13
end

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

  retIndex
end

@created_at_list = []
910.times do |i|
  @created_at_list[i] = get_created_at
end
@created_at_list.sort!

File.open("sales_records.sql", "w") do |f|
  f.puts 'CREATE TABLE IF NOT EXISTS "sales_records" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "product_id" integer, "created_at" date);'
  f.puts 'INSERT INTO sales_records VALUES'

  910.times do |i|
    id = i + 1
    user_id = get_user_id
    product_id = get_product_id
    created_at = @created_at_list[i]
    f.print "(#{id},#{user_id},#{product_id},'#{created_at}'),"
    if (i + 1) % 50 == 0
      f.print "\n"
    end
  end
end
