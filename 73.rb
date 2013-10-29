#leap year

puts "What's the start year?"
s_year = gets.chomp

puts "What's the end year?"
e_year = gets.chomp

start_year = s_year.to_i

while start_year < e_year.to_i
	if start_year % 4 == 0
		if start_year % 100 != 0 || start_year % 400 == 0
		puts start_year
	end

	end

    start_year += 1
end



