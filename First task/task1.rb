  # frozen_string_literal: true

  # Task 1.
  def helloMaker
    puts '-' * 80
    puts 'Доброго времени суток.'
    puts '-' * 80
    puts 'Введите имя: '
    input_name = gets
    puts 'Введите фамилию: '
    input_surname = gets
    puts 'Введите возраст: '
    input_age = gets.to_i
    puts '-' * 80
    if input_age.to_i < 18
      puts "Привет, #{input_name.capitalize} #{input_surname.capitalize}.\nТебе меньше 18 лет, но начать учиться программировать никогда не рано"
      "Привет, #{input_name.capitalize} #{input_surname.capitalize}.\nТебе меньше 18 лет, но начать учиться программировать никогда не рано"
    else
      puts "Привет, #{input_name} #{input_surname}. \nСамое время заняться делом!"
      "Привет, #{input_name} #{input_surname}. \nСамое время заняться делом!"
    end
  end

  # Task 2.
  def fooBar
    puts '-' * 80
    puts 'Введите пару чисел: '
    figures = []
    (0..1).each do |i|
      figures[i] = gets.to_i
    end
    flag = false
    figures.each do |figure|
      if figure == 20
        flag = true
        puts "Второе введёное число равно: #{figures[1]}"
        return "Второе введёное число равно: #{figures[1]}"
      end
    end
    if flag == false
      sum = 0
      figures.each { |figure| sum += figure }
      puts "Сумма всех элементов равна: #{sum}"
      "Сумма всех элементов равна: #{sum}"
    end
  end

  def menu
    loop do
      puts "Выбор задания :
      1. Первое задание
      2. Второе задание
      -1. Выход"
      input = gets.to_i
      if input == 1
        helloMaker
      elsif input == 2
        fooBar
      elsif input == -1
      break
      else
        puts "Команда не найдена."
      end
    end
  end



