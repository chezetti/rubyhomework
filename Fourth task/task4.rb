class CashMachine

  def initialize
    if File.exist?("balance.txt")
    f = File.open("balance.txt")
    @balance = f.read.to_f
    f.close
    elsif File.exist?("balance.txt") == false
      File.open("balance.txt", "w") { File.write(100.00) }
    end
  end

  def deposit(sum)
    if sum <= 0
      puts 'Сумма должна быть больше нуля.'
    else
      @balance = @balance + sum
      balance
    end
  end

  def withdraw(sum)
    if sum <= 0
      puts 'Сумма должна быть больше нуля.'
    elsif sum > @balance
      puts 'Недостаточно средств.'
    else
      @balance = @balance - sum
      balance
    end
  end

  def balance
    puts "Ваш баланс: #{@balance}"
  end

  def quit
    f = File.open('balance.txt', 'w')
    f.write(@balance)
    f.close
  end

  def self.init

    cash_machine = CashMachine.new

    loop do
      puts "Меню:
      (B) Баланс
      (D) Депозит
      (W) Вывод
      (Q) Quit"

      choose = gets.chomp

      case choose.downcase
      when 'b'
        cash_machine.balance

      when 'd'
        puts 'Введите сумму для депозита:'
        cash_machine.deposit(gets.to_f)

      when 'w'
        puts 'Введите сумму для списания:'
        cash_machine.withdraw(gets.to_f)

      when 'q'
        cash_machine.quit
        break
      else
        puts 'Неверная команда.'
      end
    end
  end

end