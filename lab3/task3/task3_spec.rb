require 'rspec'
require './task3.rb'

RSpec.describe "task three" do
    before(:each) {File.write(TEXT, "100.0", mode:"w")}

    it '#deposit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n", 100, "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (deposit) W (withdrow) B (balance) Q(quit)\nВведите сумму которую желаете внести для депозита\nнажмите  D (deposit) W (withdrow) B (balance) Q(quit)\n").to_stdout
    end

    it '#deposit with mistake' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n", -100, 100, "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (deposit) W (withdrow) B (balance) Q(quit)\nВведите сумму которую желаете внести для депозита\nСумма должна быть > 0\nнажмите  D (deposit) W (withdrow) B (balance) Q(quit)\n").to_stdout
    end

    it '#balance' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("b\n", "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (deposit) W (withdrow) B (balance) Q(quit)\nВаш балнс 100.0\nнажмите  D (deposit) W (withdrow) B (balance) Q(quit)\n").to_stdout
    end

    it '#quit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (deposit) W (withdrow) B (balance) Q(quit)\n").to_stdout
    end

    it '#withdraw' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n", 50, "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (deposit) W (withdrow) B (balance) Q(quit)\nВведите сумму которую желаете снять\nнажмите  D (deposit) W (withdrow) B (balance) Q(quit)\n").to_stdout
    end

    it '#withdraw with mistake' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n", -150, 50, "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (deposit) W (withdrow) B (balance) Q(quit)\nВведите сумму которую желаете снять\nСумма должна быть в диапазоне между нулём и текущим балансом\nнажмите  D (deposit) W (withdrow) B (balance) Q(quit)\n").to_stdout
    end
  end
