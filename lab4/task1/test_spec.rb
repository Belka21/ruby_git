require 'rspec'
require_relative 'task1'

RSpec.describe CashMachine do
    before(:each) {File.write(TEXT, '100.0', mode:'w')}

    it '#start balance' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('b', 'q')
      expect (subject.init)
      expect{ subject.balance }.to output("Ваш балнс 100.0\n").to_stdout
    end

    it '#deposit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('d', 20, 'q')
      expect (subject.init)
      expect(File.read('balance.txt')).to eql('120.0')
    end

    it '#withdraw' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('w', 30, 'q')
      expect (subject.init)
      expect(File.read('balance.txt')).to eql('70.0')
    end
  end
