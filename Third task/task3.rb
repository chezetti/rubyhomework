def balance
  if File.exist?("balance.txt")
    f = File.open("balance.txt")
    balance = f.read.to_f
    f.close
  else
    puts "Файл не существует. Создать новый?"
    input = gets
    if input == "Да"
      File.open("balance.txt", "w") {|f| f.write(100.00) }
    else
      menu
    end
  end

  loop do
    puts "Нажмите B, чтобы проверить баланс \nНажмите D, чтобы внести деньги \nНажмите W, чтобы вывести деньги \nНажмите Q, чтобы выйти"
    choose = gets.chomp

    case choose.downcase
    when 'b'
      puts "Ваш баланс: #{balance}"
    when 'd'
      puts 'Введите сумму депозита: '
      money_input = gets.to_f
      if money_input <= 0
        puts 'Сумма для депозита должна быть больше нуля.'
      else
        balance += money_input
        puts "Ваш баланс: #{balance}"
        f = File.open('balance.txt', 'w')
        f.write(balance)
        f.close
      end
    when 'w'
      puts 'Введите сумму для снятия: '
      money_output = gets.to_f
      if money_output <= 0
        puts 'Сумма для снятия должна больше нуля.'
      elsif money_output > balance
        puts 'Недостаточно средств на балансе.'
      else
        balance -= money_output
        puts "Ваш баланс: #{balance}"
      end
      f = File.open('balance.txt', 'w')
      f.write(balance)
      f.close
    when 'q'
      f = File.open('balance.txt', 'w')
      f.write(balance)
      f.close
      break
    else
      puts 'Некорректно выбран пункт меню.'
    end
  end
end

def read
  file = File.open('input.txt')
  students = file.readlines.map { |line| line.chomp }
  file.close
  result = []

  loop do
    puts 'Введите возраст: '
    input = gets.to_i
    break if input == -1

    students.each { |student|
      result.append(student) if student.split(' ')[2].to_i == input
    }
    break if students.length == result.length
  end

  file = File.open('result.txt', 'w')
  result.each { |s|
    puts s
    file.write(s + "\n")
  }
  file.close
end

def menu
  loop do
    puts "Меню: "
    puts '1. Банковский счёт'
    puts '2. Чтение из файла'
    puts '0. Выход'

    choose = gets.to_i
    case choose
    when 1
      balance
    when 2
      read
    when 0
      break
    else
    end
  end
end
