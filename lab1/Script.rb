require '../utilities'

def greeting
	stdout "enter your Name"
	name = gets.chomp
	stdout "enter your Surname"
	surname = gets.chomp
	stdout "enter your Age"
	age = gets.to_i
	if age < 18
		stdout "Hello, #{name} #{surname}. You are less then 18 years, but starting programming is never early"
	else
		stdout "Hello, #{name} #{surname}. This time is nice for learning programming"
	end
end

def foobar
	stdout "enter first number: "
	first = gets.to_i
	stdout "enter second number: "
	second = gets.to_i

	if first == 20
		puts "Result = #{second}"
		second
	elsif second == 20
		puts "Result = #{first}"
		first
	else
		puts "Result = #{first + second}"
		first + second
	end
end

greeting