require "sinatra"
require "rack-flash"
require_relative "model"

require "./lib/user_database"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @user_database = UserDatabase.new
  end

  get "/" do
    erb :root
  end

  get "/registration" do
    erb :registration_page, :locals => { :thanks_flash => "" }
  end

  post "/registration" do
    username = params[:username]
    pwrd = params[:password]
    thanks = flash.now[:notice] = "Thank you for registering."
    erb :registration_page, :locals => { :thanks_flash => thanks }
  end
end
