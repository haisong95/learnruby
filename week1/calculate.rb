def calculate_total cards
	arr = cards.map{|e| e[1]}

	total = 0
	arr.each do |value|
		if value == "A"
			 total += 11      #Ruby is read descendly. write it in correct order!
			
		elsif value.to_i == 0
			 total += 10
		else
			total += value.to_i
		end
	end

	arr.select{|e| e == "A"}.count.times do
		total -= 10 if total > 21 
	end

	total
end

a = [["S","J"], ["S","A"],["D","7"]]
puts calculate_total(a)
