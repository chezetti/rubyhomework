module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      puts verb
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        puts action
        break if action == 'q'
      end

      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each_with_index do |post, index|
      puts("#{index} - #{post}")
    end
  end

  def show
    puts('Введите id:')
    id = gets.to_i
    puts id
    if id >= @posts.length
      puts('Некорректный id.')
    else
      puts("#{id} - #{@posts[id]}")
    end
  end

  def create
    puts('Введите текст поста:')
    text = gets.chomp
    puts text
    @posts.append(text)
    puts "#{@posts.length - 1} - #{text}"
  end

  def update
    puts('Введите id:')
    id = gets.to_i
    puts id
    if id >= @posts.length
      puts('Некорректный id.')
    else
      puts('Введите текст нового поста:')
      text = gets.chomp
      @posts[id] = text
      return puts("#{id} - #{@posts[id]}")
    end
  end

  def destroy
    puts('Введите id:')
    id = gets.to_i
    puts id
    if id >= @posts.length
      puts('Некорректный id.')
    else
      @posts.delete_at(id)
    end
  end
end

class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    @comments.each_with_index do |comment, index|
      return puts("#{index} #{comment}")
    end
  end

  def show
    puts('Введите id:')
    id = gets.to_i
    puts id
    if id >= @comments.length
      puts('Некорректный id.')
    else
      return puts("#{id} - #{@comments[id]}")
    end
  end

  def create
    puts('Введите комментарий:')
    text = gets.chomp
    puts text
    @comments.append(text)
    return puts("#{@comments.length - 1} - #{text}")
  end

  def update
    puts('Введите id:')
    id = gets.to_i
    puts id
    if id >= @comments.length
      puts('Некорректный id.')
    else
      puts('Введите новый текст комментария:')
      text = gets.chomp
      @comments[id] = text
      return puts("#{id} #{@comments[id]}")
    end
  end

  def destroy
    puts('Введите id:')
    id = gets.to_i
    puts id
    if id >= @comments.length
      puts('Некорректный id.')
    else
      @comments.delete_at(id)
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choice = gets.chomp
      puts choice

      PostsController.connection(@routes['posts']) if choice == '1'
      CommentsController.connection(@routes['comments']) if choice == '2'
      break if choice == 'q'
    end

  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new
router.init
