def my_min(list)
  list.each do |el|
    return el if list.all? {|el2| el <= el2}
  end
end

def my_min2(list)
  min = nil
  list.each do |el|
    min ||= el
    min = el if el < min
  end
  min
end
#n^3
def largest_contiguest_sub_sum(list)
  arr = []
  (0...list.length).to_a.each do |start|
    (start...list.length).to_a.each do |end_idx|
      arr << list[start..end_idx]
    end
  end
  max = nil
  arr.each do |sub_array|
    sum = sub_array.reduce(:+)
    max ||= sum
    max = sum if sum > max
  end
  max
end

def largest_contiguest_sub_sum2(list)
  sum = 0
  largest_sum = nil
  list.each do |el|
    sum += el
    largest_sum ||= sum
    largest_sum = sum if sum > largest_sum
    sum = 0 if sum < 0
  end
  largest_sum
end

def first_anagram?(str,str2)
  subs=str.chars.permutation.to_a
  subs.map!{|sub_arr| sub_arr.join}
  subs.include?(str2)
end

def second_anagram?(str,str2)
  str=str.chars
  str2=str2.chars
  i = 0
  while i < str.length
    j = 0
    deletion = false
    while j < str2.length
      if str[i] == str2[j]
        str.delete_at(i)
        str2.delete_at(j)
        deletion = true
      else
        j += 1
      end
    end
    i+=1 unless deletion
  end
  str.empty? && str2.empty?
end

def third_anagram?(str,str2)
  str.chars.sort == str2.chars.sort
end

def fourth_anagram?(str,str2)
  c_hash1 = Hash.new(0)
  str.each_char do |char|
    c_hash1[char] += 1
  end

  c_hash2 = Hash.new(0)
  str2.each_char do |char|
    c_hash2[char] += 1
  end

  c_hash1 == c_hash2
end

def bonus_anagram?(str,str2)
  c_hash = Hash.new(0)
  str.each_char do |char|
    c_hash[char] += 1
  end

  str2.each_char do |char|
    c_hash[char] -= 1
  end
  c_hash.values.all? {|v| v == 0}
end
