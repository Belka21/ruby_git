$stage = ""

def stdout(message)
	if $stage != "test"	
		puts message
	end 
	message
end
