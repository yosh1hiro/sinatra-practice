require 'sinatra'
require 'sinatra/reloader'

get '/hello/:name' do
  "hello #{params[:name]}"
end

get '/hello/:name' do |n|
  "hello #{n}"
end

get '/hello/:first/:last?' do |f, l|
  "hello #{f}  #{l}"
end

get '/from/*/to/*' do |f, t|
  "from #{f} to #{t}"
end

get %r{/users/([0-9])} do |i|
  "user id = #{i}"
end
