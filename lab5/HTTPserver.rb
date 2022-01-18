require "socket"
require 'rack'
require_relative 'CashMachine'

server = TCPServer.new('0.0.0.0', 3000)

class App
  def call(env)
    req = Rack::Request.new(env)

    params = env["QUERY_PARAMS"]
    cash = CashMachine.new

    case req.path
    when "/"
      [200, { "Content-Type" => "text/html" }, ["Банкомат"]]
    when "/withdraw"
      if params.nil? || params["value"].nil?
        [402, { "Content-Type" => "text/html" }, ["Введите сумму для снятия"]]
      elsif cash.withdraw(params["value"]) == 0
        [200, { "Content-Type" => "text/html" }, ["Вы сняли #{params["value"]}, теперь ваш баланс #{cash.balance}"]]
      else
        [403, { "Content-Type" => "text/html" }, ["Вы ввели сумму больше чем имеете на счету"]]
      end
    when "/deposit"
      if params.nil? || params["value"].nil?
        [401, { "Content-Type" => "text/html" }, ["Введите сумму для внесения на депозит"]]
      elsif cash.deposit(params["value"]) == 0
        [200, { "Content-Type" => "text/html" }, ["Вы внесли #{params["value"]}, теперь ваш баланс #{cash.balance}"]]
      else
        [403, { "Content-Type" => "text/html" }, ["Сумма депозита должна быть > 0"]]
      end
    when "/balance"
      [200, { "Content-Type" => "text/html" }, ["Ваш баланс #{cash.balance}"]]
    else
      [404, { "Content-Type" => "text/html" }, ["Not Found this page"]]
    end
  end
end

def array_to_hash(array)
  result = {}

  array.each do |item|
    key = item.split("=")[0]
    value = item.split("=")[1]
    result[key] = value
  end
  result
end

app = App.new

while (connection = server.accept)
  request = connection.gets
  method, full_path, http_ver = request.split(' ')
  path, params = full_path.split('?')

  status, headers, body = app.call({
                                     'REQUEST_METHOD' => method,
                                     'PATH_INFO' => path,
                                     'QUERY_PARAMS' => params != nil ? array_to_hash(params.split('&')) : nil
                                   })

  connection.print "#{http_ver} #{status} \r\n"

  headers.each { |key, value|  connection.print("#{key}: #{value}\r\n") }

  connection.print "\r\n"

  body.each { |part| connection.print(part) }

  connection.close
end
