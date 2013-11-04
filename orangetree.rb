class OrangeTree
	def initialize 
	  @height =0
	  @age = 0
	  @alive = true
	  @orange = 0
	end

  def height
  	if @alive
  	@height
    else
  	'A dead tree is not very tall!'
     end
   end
   


	def one_year_passes
		 @height += 0.4
		 @age += 1
		 @orange = 0
    if @age > 3
    	@orange = (@height * 10).to_i
    end
    if @age > 8
    	@alive = false
    end
	end

  def count_the_orange
     if @alive
     	 if @orange > 0
         puts "there are #{@orange} oranges on the tree."
       else
       	puts "there's no orange on the tree!"
       end
     else
     	 puts "the tree is died :( "
     end
  end

  def pick_an_orange
  	if @alive
  		if @orange > 0
  			@orange -= 1
  			puts "what a dilicious orange!"
  		else
  			puts "sorry, the tree is too young to have a orange!"
  		end
  	else
  		puts "sorry, the tree is died!"
  	end
  end
 end



mango = OrangeTree.new

mango.one_year_passes
mango.one_year_passes
mango.one_year_passes
mango.one_year_passes

mango.count_the_orange
mango.pick_an_orange
mango.count_the_orange

























