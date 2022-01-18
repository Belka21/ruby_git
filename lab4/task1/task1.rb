TEXT = 'balance.txt'
class CashMachine
  DEFAULT = 100.0
  @balance = DEFAULT
  def initialize
    if !(File.zero?(TEXT))
      @balance = File.readlines(TEXT).first.chomp.to_f
    end
  end

  def balance
    puts "Ваш балнс " + @balance.to_s
  end

  def deposit (sum)
    if sum < 0
      puts "Сумма должна быть > 0"
      sum = gets.to_f
    else
      @balance += sum
    end
  end

  def withdraw(sum)
    if sum < 0 || sum > @balance
      puts "Сумма должна быть в диапазоне между нулём и текущим балансом"
      sum = gets.to_f
    else
      @balance -= sum
    end
  end

  def init
    puts "Ваш баланс #{@balance} нажмите D (deposit) W (withdrow) B (balance) Q(quit)"

    loop do
      input = gets.chomp.downcase

      case input
      when "d"
        puts "Введите сумму которую желаете внести для депозита"
        deposit(gets.to_f)
      when "w"
        withdraw(gets.to_f)
      when "b"
        balance
      when "q"
        break
      end

      puts "нажмите  D (deposit) W (withdrow) B (balance) Q(quit)"
    end

    File.write(TEXT, @balance)
  end
end
 #
 # cashMachine = CashMachine.new
 # cashMachine.init

