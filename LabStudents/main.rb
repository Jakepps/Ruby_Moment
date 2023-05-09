# frozen_string_literal: true
require 'sinatra'
require 'thin'
require 'rubbish_code'

set :port, 8000

LoggerHolder.instance.level = Logger::DEBUG

get '/about' do
  '<h2>Приветстую, это сайт написанный на руби для учета студентов.</h2><a href="/uni">Перейти на страницу студентов!</a>'
end

get '/uni' do
  MainWindow.new.create.show
end