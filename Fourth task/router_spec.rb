# frozen_string_literal: true

require 'rspec'
require 'stringio'

require_relative 'router'

describe Router do

  it 'should create new post and show it' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("1", "POST", "Нулевой пост", "q", "q")
    router = Router.new
    expect(router.init).to eql("0 - Нулевой пост")
  end

  it 'should return post by index' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("1", "GET", "index", "0", "q", "q")
    router = Router.new
    expect(router.init).to eql("0 - Нулевой пост")
  end

  it 'should update post by index' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("1", "PUT", "0", "Новый нулевой пост", "q", "q")
    router = Router.new
    expect(router.init).to eql("0 - Новый нулевой пост")
  end

  it 'should delete post by index' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("1", "DELETE", "0", "q", "q")
    router = Router.new
    expect(router.init).to eql("")
  end

  it 'should create new comment and show it' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("2", "POST", "Нулевой пост", "q", "q")
    router = Router.new
    expect(router.init).to eql("0 - Нулевой пост")
  end

  it 'should return comment by index' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("2", "GET", "index", "0", "q", "q")
    router = Router.new
    expect(router.init).to eql("0 - Нулевой пост")
  end

  it 'should update comment by index' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("2", "PUT", "0", "Новый нулевой пост", "q", "q")
    router = Router.new
    expect(router.init).to eql("0 - Новый нулевой пост")
  end

  it 'should delete comment by index' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("2", "DELETE", "0", "q", "q")
    router = Router.new
    expect(router.init).to eql("")
  end

end
