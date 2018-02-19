require "sinatra"
require "sinatra/reloader" if development?
require "pg"
require_relative './models/post.rb'
require_relative './controllers/post_controllers.rb'
require_relative './controllers/static_controller.rb'


use Rack::Reloader

use Rack::MethodOverride

run Rack::Cascade.new([
  PostsController,
  StaticController
])
