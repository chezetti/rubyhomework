# frozen_string_literal: true

require 'rspec'
require 'stringio'

require_relative 'task3'

describe "Balance operations" do
  it 'should create new file with starting balance 100.00 if it is not exists' do
    @buffer = StringIO.new()
    @filename = "balance.txt"
    @content = "120.00"
    allow(File).to receive(:open).with(@filename,'w').and_yield(@buffer)
    File.open(@filename, 'w') {|f| f.write(@content)}
    expect(@buffer.string).to eql(@content)
  end

  it 'should reverse word if word does not ends with "CS"' do
  end
end

describe "File operations" do
  it 'should output array, which contain hash of pokemons' do
  end
end
