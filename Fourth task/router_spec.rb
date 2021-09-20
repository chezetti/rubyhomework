# frozen_string_literal: true

require 'rspec'
require 'stringio'

require_relative 'router'

describe Router do

  it 'should create new post and show it' do
    allow_any_instance_of(Router).to receive(:gets).and_return("1", "q")
    allow_any_instance_of(Resource).to receive(:gets).and_return("POST", "q")
    allow_any_instance_of(PostsController).to receive(:gets).and_return("Нулевой пост")
    router = Router.new
    expect(router.init)
    expect do
      PostsController.new.create
    end.to output("Введите текст поста:\nНулевой пост\n0 - Нулевой пост\n").to_stdout
  end

  it 'should return post by id' do
    allow_any_instance_of(Router).to receive(:gets).and_return("1", "q")
    allow_any_instance_of(Resource).to receive(:gets).and_return("POST", "GET", "show", "q")
    allow_any_instance_of(PostsController).to receive(:gets).and_return("Нулевой пост", "0")
    router = Router.new
    expect(router.init)
    expect do
      PostsController.new.show
    end.to output("Введите id:\n0\nНекорректный id.\n").to_stdout
  end

  it 'should update post by id' do
    allow_any_instance_of(Router).to receive(:gets).and_return("1", "q")
    allow_any_instance_of(Resource).to receive(:gets).and_return("POST", "PUT", "q")
    allow_any_instance_of(PostsController).to receive(:gets).and_return("Нулевой пост", "0", "Новый нулевой пост")
    router = Router.new
    expect(router.init)
    expect do
      PostsController.new.update
    end.to output("Введите id:\n0\nНекорректный id.\n").to_stdout
  end

  it 'should delete post by id' do
    allow_any_instance_of(Router).to receive(:gets).and_return("1", "q")
    allow_any_instance_of(Resource).to receive(:gets).and_return("POST", "DELETE", "q")
    allow_any_instance_of(PostsController).to receive(:gets).and_return("Нулевой пост", "0")
    router = Router.new
    expect(router.init)
    expect do
      PostsController.new.destroy
    end.to output("Введите id:\n0\nНекорректный id.\n").to_stdout
  end

  it 'should create new comment and show it' do
    allow_any_instance_of(Router).to receive(:gets).and_return("2", "q")
    allow_any_instance_of(Resource).to receive(:gets).and_return("POST", "q")
    allow_any_instance_of(CommentsController).to receive(:gets).and_return("Нулевой комментарий")
    router = Router.new
    expect(router.init)
    expect do
      CommentsController.new.create
    end.to output("Введите комментарий:\nНулевой комментарий\n0 - Нулевой комментарий\n").to_stdout
  end

  it 'should return comment by id' do
    allow_any_instance_of(Router).to receive(:gets).and_return("2", "q")
    allow_any_instance_of(Resource).to receive(:gets).and_return("POST", "GET", "show", "q")
    allow_any_instance_of(CommentsController).to receive(:gets).and_return("Нулевой комментарий", "0")
    router = Router.new
    expect(router.init)
    expect do
      CommentsController.new.show
    end.to output("Введите id:\n0\nНекорректный id.\n").to_stdout
  end

  it 'should update comment by id' do
    allow_any_instance_of(Router).to receive(:gets).and_return("2", "q")
    allow_any_instance_of(Resource).to receive(:gets).and_return("POST", "PUT", "q")
    allow_any_instance_of(CommentsController).to receive(:gets).and_return("Нулевой комментарий", "0", "Новый нулевой комментарий")
    router = Router.new
    expect(router.init)
    expect do
      CommentsController.new.update
    end.to output("Введите id:\n0\nНекорректный id.\n").to_stdout
  end

  it 'should delete comment by id' do
    allow_any_instance_of(Router).to receive(:gets).and_return("2", "q")
    allow_any_instance_of(Resource).to receive(:gets).and_return("POST", "DELETE", "q")
    allow_any_instance_of(CommentsController).to receive(:gets).and_return("Нулевой комментарий", "0")
    router = Router.new
    expect(router.init)
    expect do
      CommentsController.new.destroy
    end.to output("Введите id:\n0\nНекорректный id.\n").to_stdout
  end

end
