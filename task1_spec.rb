# frozen_string_literal: true

require 'rspec'

require_relative 'task1'

describe Greetings do
  it 'should do ok for age equal or bigger than 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Иван', 'Соболев', 21)
    expect(Greetings.helloMaker)
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Владимир', 'Громов', 20)
    expect(Greetings.helloMaker)
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Василий', 'Андреев', 43)
    expect(Greetings.helloMaker)
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Снежанна', 'Лебедева', 18)
    expect(Greetings.helloMaker)
  end

  it 'should do ok for age smaller than 18 ' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Максим', 'Моисеев', 14)
    expect(Greetings.helloMaker)
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Денис', 'Григорьев', 15)
    expect(Greetings.helloMaker)
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Пётр', 'Мартынов', 16)
    expect(Greetings.helloMaker)
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Светлана', 'Орехова', 17)
    expect(Greetings.helloMaker)
  end
end

describe Foobar do
  it 'should return second number if one of the numbers are equal to 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 32)
    expect(Foobar.fooBar)
  end
  it 'should return sum of the numbers if no one of the numbers are not equal to 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(19, 50)
    expect(Foobar.fooBar)
  end
end
