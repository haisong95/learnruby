def log desc, &block
	puts 'Beginning"'+ desc + '"...'
	result = block.call
	puts '..."' + desc + '"finished,returing' + result.to_s
end


