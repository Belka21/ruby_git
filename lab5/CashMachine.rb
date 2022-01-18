class CashMachine
  TEXT = 'balance.txt'
  DEFAULT = 100.0
  @balance = DEFAULT
  def initialize
    if !(File.zero?(TEXT))
      @balance = File.readlines(TEXT).first.chomp.to_f
    end
  end

  def balance
    @balance
  end

  def deposit(value)
    value = value.to_f

    if value >= 0
      @balance = @balance + value
      write_to_file
      0
    else
      -1
    end
  end

  def withdraw(value)
    value = value.to_f

    if value <= @balance
      @balance = @balance - value
      write_to_file
      0
    else
      -1
    end
  end

  private

  def write_to_file
    File.write(TEXT, @balance, mode: "w")
  end
end
