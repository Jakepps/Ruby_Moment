require 'sinatra'
#require 'mc_delta'

set :port, 8000

get '/' do
  '<h1>Welcome to my website!</h1>'
end

get '/about' do
  '<h2>About me</h2><p>I am a Ruby developer.</p>'
end

get '/contact' do
  '<h2>Contact me</h2><p>You can reach me at john@example.com.</p>'
end
