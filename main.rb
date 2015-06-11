require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
)

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

class Comment < ActiveRecord::Base

end

get '/' do
  @comments = Comment.order("id desc").all
  @title = "bbs"
  erb :index
end

post '/' do
  Comment.create({body: params[:body]})
  redirect '/'
end

post '/delete' do
  Comment.find(params[:id]).destroy
end
