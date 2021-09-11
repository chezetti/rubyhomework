# frozen_string_literal: true

require 'rspec'

require_relative 'task1'

describe "Greeting" do
  it 'should do ok for age equal or bigger than 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Иван', 'Соболев', 21)
    expect(helloMaker).to eql("Привет, Иван Соболев. \nСамое время заняться делом!")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Владимир', 'Громов', 20)
    expect(helloMaker).to eql("Привет, Владимир Громов. \nСамое время заняться делом!")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Василий', 'Андреев', 43)
    expect(helloMaker).to eql("Привет, Василий Андреев. \nСамое время заняться делом!")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Снежанна', 'Лебедева', 18)
    expect(helloMaker).to eql("Привет, Снежанна Лебедева. \nСамое время заняться делом!")
  end

  it 'should do ok for age smaller than 18 ' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Максим', 'Моисеев', 14)
    expect(helloMaker).to eql("Привет, Максим Моисеев.\nТебе меньше 18 лет, но начать учиться программировать никогда не рано")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Денис', 'Григорьев', 15)
    expect(helloMaker).to eql("Привет, Денис Григорьев.\nТебе меньше 18 лет, но начать учиться программировать никогда не рано")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Пётр', 'Мартынов', 16)
    expect(helloMaker).to eql("Привет, Пётр Мартынов.\nТебе меньше 18 лет, но начать учиться программировать никогда не рано")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Светлана', 'Орехова', 17)
    expect(helloMaker).to eql("Привет, Светлана Орехова.\nТебе меньше 18 лет, но начать учиться программировать никогда не рано")
  end
end

describe "Foobar" do
  it 'should return second number if one of the numbers are equal to 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 32)
    expect(fooBar).to eql("Второе введёное число равно: 32")
  end
  it 'should return sum of the numbers if no one of the numbers are not equal to 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(19, 50)
    expect(fooBar).to eql("Сумма всех элементов равна: 69")
  end
end
