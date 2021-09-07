# frozen_string_literal: true

# Task 1.
class Greetings
  def helloMaker
    puts '-' * 80
    puts 'Доброго времени суток.'
    puts '-' * 80
    puts 'Введите имя: '
    name = gets.chomp
    puts 'Введите фамилию: '
    surname = gets.chomp
    puts 'Введите возраст: '
    age = gets.chomp
    puts '-' * 80
    if age.to_i < 18
      puts "Привет, #{name.capitalize} #{surname.capitalize}.
      Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    else
      puts "Привет, #{name} #{surname}. Самое время заняться делом!"
    end
    puts '-' * 80
  end
end

# Task 2.
class Foobar
  def fooBar
    puts 'Введите пару чисел: '
    figures = []
    (0..1).each do |i|
      figures[i] = gets.chomp.to_i
    end
    flag = false
    figures.each do |figure|
      if figure == 20
        puts "Второе введёное число равно: #{figures[1]}"
        flag = true
      end
    end
    if flag == false
      sum = 0
      figures.each { |figure| sum += figure }
      puts "Сумма всех элементов равна: #{sum}"
    end
  end
end

class Main
  def run
    gr = Greetings.new
    gr.helloMaker
    foo = Foobar.new
    foo.fooBar
  end
end

main = Main.new
main.run
