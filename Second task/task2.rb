  # Task 1
  def letters_calc
    puts "Введите слово: "
    word = gets.chomp
    if word.end_with?("CS") == true
      puts "Результат: #{2**word.length}"
      "Результат: #{2**word.length}"
    else
      puts "Результат: #{word.reverse}"
      "Результат: #{word.reverse}"
    end
  end

  # Task 2
  def pokemons_array
    pokemons = []
    puts "Какое количество покемонов следует добавить? "
    count = gets.to_i
    count.times do
      pokemon = {}
    puts "Введите имя: "
    pokemon[:name] = gets
    puts "Введите цвет: "
    pokemon[:color] = gets
    pokemons << pokemon
    end
    puts "Результат: #{pokemons}"
    "Результат: #{pokemons}"
  end

  def menu
    loop do
      puts "Выбор задания :
      1. Первое задание
      2. Второе задание
      -1. Выход"
      input = gets.to_i
      if input == 1
        letters_calc
      elsif input == 2
        pokemons_array
      elsif input == -1
        break
      else
        puts "Команда не найдена."
      end
    end
  end
