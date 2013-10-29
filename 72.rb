puts "say something"

while true
	said = gets.chomp
	if said == "BYE"
        puts "BYE SWEETIE"
		break
	end
	if said != said.upcase
		puts "HUH?? I CAN'T HEAR!!!"
	else
		random_year = 1930 + rand(21)
		puts "No, Not Since #{random_year}"
	end
end

