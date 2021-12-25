require './Script'
require 'rspec'

RSpec.describe "Main" do
	it "#word first_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return("Socks")
		expect(word).to eq("skcoS")
	end

	it "#word second_solution" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return("Socs")
		expect(word).to eq(16)
	end

	it "#pokemons" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return(2, "Pikachu", "Yellow", "Bulbazavr", "Blue")
		expect(pokemons).to eq([{ "Pikachu" => "Yellow" }, { "Bulbazavr" => "Blue" }])
	end

end
