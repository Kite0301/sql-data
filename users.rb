def get_gender
  rand <= 0.4 ? 0 : 1
end

def get_age
  array = [1, 1, 3, 4, 5, 6, 7, 8, 9, 9, 10, 11, 11, 10, 10, 9, 9, 9, 8, 8, 8, 7, 7, 6, 6, 5, 4, 4, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  get_random_index(array) + 13
end

def get_name(gender, male_names, female_names, number)
  case gender
    when 0 then
      male_names[number]
    when 1 then
      female_names[number]
  end
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

File.open("users.sql", "w") do |f|
  f.puts 'CREATE TABLE IF NOT EXISTS "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "gender" integer,"age" integer);'
  f.puts 'INSERT INTO users VALUES'
  male_names = []
  female_names = []
  File.open("male_names.txt", "r") do |f|
    male_names = f.read.split(/\R/).uniq
  end
  File.open("female_names.txt", "r") do |f|
    female_names = f.read.split(/\R/).uniq
  end

  325.times do |i|
    id = i + 1
    gender = get_gender
    name = get_name(gender, male_names, female_names, i)
    age = get_age
    f.print "(#{id},\"#{name}\",#{gender},#{age}),"
    if (i + 1) % 50 == 0
      f.print "\n"
    end
  end
end
