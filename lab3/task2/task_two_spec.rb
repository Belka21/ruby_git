require 'rspec'
require './task_two.rb'

RSpec.describe "task_two" do

  it "#any age" do
  allow_any_instance_of(Kernel).to receive(:gets).and_return(0, -2, 1, 20, 20, 19, 18, 21, 22, 32, 23, 41, 18)
    expect{read_file}.to output("Введите возраст студента\nВведите возраст студента\nВведите возраст студента\nВведите возраст студента\nВведите возраст студента\nВведите возраст студента\nВведите возраст студента\nВведите возраст студента\nВведите возраст студента\nВведите возраст студента\nВведите возраст студента\nФайл исчерпал себя\nБирюков Марк 20\nТрофимов Кирилл 19\nКириллов Богдан 21\nРудакова Дарья 41\nНикифорова София 20\nЯковлев Фёдор 18\nГоловин Константин 18\nУшакова Вероника 22\nАкимова Майя 32\nМаслова Есения 23\n").to_stdout
  end


   it "#exit by -1" do
     allow_any_instance_of(Kernel).to receive(:gets).and_return(-1)
     expect{read_file}.to output("Введите возраст студента\nПока\n").to_stdout
   end
end
