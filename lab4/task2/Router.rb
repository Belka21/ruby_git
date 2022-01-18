require_relative 'PostsController'
require_relative 'CommentsController'

class Router
  def initialize
    @routes = {} #инициализация, создание двумерного массива для хранения ресурсов
  end

  def init
    resources(PostsController, 'posts') # создание экземпляра контроллера
    resources(CommentsController, 'comments') # создание экземпляра контроллера

    loop do #бесконечный цикл пока не отдадим команду на выход
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp.upcase.strip #получение команды от пользователя

      PostsController.connection(@routes['posts']) if choise == '1' # в случае если выбран первый ресурс, то вызывается метод connectioin от лица PostConroller
      CommentsController.connection(@routes['comments']) if choise == '2'# в случае если выбран первый ресурс, то вызывается метод connectioin от лица CommentsController
      break if choise == 'Q'
    end

    puts 'Good bye!'
  end

  #функция создаёт экземпляр необходимого класса
  # в массив по ключевому слову (тип ресурса) добавляются
  # необходимые "указатели" на вызовы методов созданного экземпляра
  # далее из Resource.rb происходит обращение к данному массиву
  # и в зависимости от выбранных там опций срабатывает вызов нужного метода
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

#router = Router.new
#router.init
