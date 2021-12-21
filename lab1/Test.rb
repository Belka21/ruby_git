require '../utilities'
$stage = "test"
require 'rspec'
require_relative './Script'


RSpec.describe "Main" do
	name = "Unic"
	surname = "Name"

	it "#greeting first_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(name, surname, 15)
		expect(greeting).to eq("Hello, #{name} #{surname}. You are less then 18 years, but starting programming is never early")
	end

	it "#greeting second_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(name, surname, 20)
		expect(greeting).to eq("Hello, #{name} #{surname}. This time is nice for learning programming")
	end

	it "#foobar first_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(5, 5)
		expect(foobar).to eq(10)
	end

	it "#foobar second_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 15)
		expect(foobar).to eq(15)
	end

	it "#foobar third_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(45, 20)
		expect(foobar).to eq(45)
	end

end