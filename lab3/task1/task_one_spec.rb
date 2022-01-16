require 'rspec'
require './task_one.rb'

RSpec.describe "task1" do
  before {File.write(TEXT, "ДжоДжо референс\nЭто ДжоДжо референс?\nДжоДжо в последнем сезоте такая себе\nОРА! ОРА! ОРА! ОРА!")}
  
  it "#index"do
    expect{index}.to output("ДжоДжо референс\nЭто ДжоДжо референс?\nДжоДжо в последнем сезоте такая себе\nОРА! ОРА! ОРА! ОРА!\n").to_stdout
  end

   it "#find" do
     expect{find(0)}.to output("ДжоДжо референс\n").to_stdout
   end

   it "#where" do
   expect{where("ДжоДжо")}.to output("ДжоДжо референс\nЭто ДжоДжо референс?\nДжоДжо в последнем сезоте такая себе\n").to_stdout
   end

   it "#update" do
     update(1, "Пика пика")
     expect{index}.to output("ДжоДжо референс\nПика пика\nДжоДжо в последнем сезоте такая себе\nОРА! ОРА! ОРА! ОРА!\n").to_stdout
   end

   it "#delete" do
     delete(2)
     expect{index}.to output("ДжоДжо референс\nПика пика\nОРА! ОРА! ОРА! ОРА!\n").to_stdout
   end


end
