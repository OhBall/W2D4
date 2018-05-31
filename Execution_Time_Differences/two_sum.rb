require 'byebug'

def bad_two_sum?(arr,target)
  arr.each_with_index do |el,i|
    arr.each_with_index do |el2,j|
      return true if el+el2 == target && i!=j
    end
  end
  false
end


# O(nlogn)
def okay_two_sum?(arr,target)
  arr = arr.sort
  i=0
  j=arr.length-1
  while i < j
    return true if arr[i]+arr[j] == target
    j -=1 if arr[i]+arr[j] > target
    i +=1 if arr[i]+arr[j] < target
  end
  false
end

def best_two_sum?(arr,target)
  hash = Hash.new { |hash, key| hash[key] = false }
  arr.each do |el|
    hash[el] = true
  end

  arr.each do |el|
    if target-el == el
      return true if arr.count(el) >= 2
      next
    end
    return true if hash[target-el]
  end
  false
end
