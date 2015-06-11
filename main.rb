require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
)

class Commnet < ActiveRecord::Base

end

get '/' do
  @commets = Commnet.order("id desc").all
  @title = "bbs"
  erb :index
end
