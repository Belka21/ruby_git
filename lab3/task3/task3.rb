DEFAULT = 100.0
TEXT = 'balance.txt'
$balance = DEFAULT

def balance
  puts "Ваш балнс " + $balance.to_s
end

def deposit
  puts "Введите сумму которую желаете внести для депозита"
  sum = gets.to_f

  if sum < 0
    puts "Сумма должна быть > 0"
    sum = gets.to_f
  else
    $balance += sum
  end
end

def withdraw
  puts "Введите сумму которую желаете снять"
  sum = gets.to_f

  if sum < 0 || sum > $balance
    puts "Сумма должна быть в диапазоне между нулём и текущим балансом"
    sum = gets.to_f
  else
    $balance -= sum
  end
end

def start
  if !(File.zero?(TEXT))
    $balance = File.readlines(TEXT).first.chomp.to_f
  end

  puts "Ваш баланс #{$balance} нажмите D (deposit) W (withdrow) B (balance) Q(quit)"

  loop do
    input = gets.downcase

    case input
    when "q\n"
      break
    when "b\n"
      balance
    when "w\n"
      withdraw
    when "d\n"
      deposit
    end

    puts "нажмите  D (deposit) W (withdrow) B (balance) Q(quit)"
  end

  File.write(TEXT, $balance)
end

#start
