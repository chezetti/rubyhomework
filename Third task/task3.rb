# task 3
def balance
  if File.exist?("balance.txt")
    f = File.open("balance.txt")
    balance = f.read.to_f
    f.close
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

# task 2
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

# task 1
STUDENTS_LIST = 'input.txt'
BUFFER = 'output.txt'

def index
  File.foreach(STUDENTS_LIST) { |student| puts student }
end

def where(pattern)
  File.foreach(STUDENTS_LIST).with_index do |student, index|
    @student_id = index if student.include?(pattern)
  end
  @student_id
end

def update(id, text)
  file = File.open(BUFFER, 'w')
  
  File.foreach(STUDENTS_LIST).with_index do |student, index|
    file.puts(id == index ? text : student)
  end

  file.close
  File.write(STUDENTS_LIST, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, "w")
  File.foreach(STUDENTS_LIST).with_index do |student, index|
      file.puts student if id != index
  end

  file.close
  File.write(STUDENTS_LIST, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def find(id)
  File.foreach(STUDENTS_LIST).with_index do |student, index|
    puts student if id == index
  end
end


def crud_menu
  loop do
    puts 'Меню для работы с файлом: '
    puts '1. Вывод данных файла.'
    puts '2. Вывод опередленной строки.'
    puts '3. Вывод строк с паттерном.'
    puts '4. Обновление опредленной строки.'
    puts '5. Удаление строки.'
    puts '0. Выход.'

    choose = gets.to_i
    case choose
    when 1
      index
    when 2
      puts 'Введите id: '
      id = gets
      find(id)
    when 3
      puts 'Введите паттерн: '
      pattern = gets
      where(pattern)
    when 4
      puts 'Введите id: '
      id = gets
      puts 'Введите текст: '
      text = gets
      update(id, text)
    when 5
      puts 'Введите id: '
      id = gets
      delete(id)
    when 0
      menu
    else
      puts "Неверный пункт меню."
    end
  end
end

def menu
  loop do
    puts "Меню: "
    puts '1. Банковский счёт.'
    puts '2. Чтение из файла.'
    puts '3. Меню для работы с файлами.'
    puts '0. Выход.'

    choose = gets.to_i
    case choose
    when 1
      balance
    when 2
      read
    when 3
      crud_menu
    when 0
      break
    else
      puts "Неверный пункт меню."
    end
  end
end

menu