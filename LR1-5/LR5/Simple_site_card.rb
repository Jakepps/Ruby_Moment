require 'sinatra'

set :port, 8000

get '/' do
  '<h1>ПРИВЕТСТВУЮ!</h1>'
end

get '/about' do
  '<h2>ОБО МНЕ</h2><p>я артем.</p>'
end

get '/contact' do
  '<h2>связь-факс</h2><p>можете связаться со мной через вк</p>'
end
