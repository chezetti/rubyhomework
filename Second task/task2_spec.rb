# frozen_string_literal: true

require 'rspec'

require_relative 'task2'

describe "Letters Calculations" do
  it 'should raise 2 to the power of word length if word ends with "CS"' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('DashfjCS')
    expect(letters_calc).to eql("Результат: 256")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('j1shbCS')
    expect(letters_calc).to eql("Результат: 128")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('111iCS')
    expect(letters_calc).to eql("Результат: 64")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('CS4CS')
    expect(letters_calc).to eql("Результат: 32")
  end

  it 'should reverse word if word does not ends with "CS"' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Dashfj')
    expect(letters_calc).to eql("Результат: jfhsaD")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('j1shb')
    expect(letters_calc).to eql("Результат: bhs1j")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('111i')
    expect(letters_calc).to eql("Результат: i111")
    allow_any_instance_of(Kernel).to receive(:gets).and_return('CS4')
    expect(letters_calc).to eql("Результат: 4SC")
  end
end

describe "Array of pokemons" do
  it 'should output array, which contain hash of pokemons' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(2, "Билли", "Оранжевый", "Гилли", "Красный")
    expect(pokemons_array).to eql("Результат: [{:name=>\"Билли\", :color=>\"Оранжевый\"}, {:name=>\"Гилли\", :color=>\"Красный\"}]")
    allow_any_instance_of(Kernel).to receive(:gets).and_return(4, "Силли", "Оранжевый", "Дилли", "Красный", "Бадди", "Белый", "Шиничи", "Желтый")
    expect(pokemons_array).to eql("Результат: [{:name=>\"Силли\", :color=>\"Оранжевый\"}, {:name=>\"Дилли\", :color=>\"Красный\"}, {:name=>\"Бадди\", :color=>\"Белый\"}, {:name=>\"Шиничи\", :color=>\"Желтый\"}]")
  end
end
