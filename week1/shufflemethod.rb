def shuffle arr

shuffled = []
number = arr.count

while number >= 0

chose = arr[rand(0..number)]
shuffled << chose
arr.delete(chose)

number -= 1

end

shuffled.delete(nil)
puts shuffled

end

shuffle ["a","b","c","d","e","f","g"]

