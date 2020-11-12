require_relative 'models/user.rb'
require_relative 'models/db.rb'

class App < Sinatra::Base

    enable :sessions

    before do
        if session[:user] == nil
            @user = User.new
            session[:user] = @user.get
        end
    end

    get '/' do
        slim :about
    end

    get '/login' do
        slim :login
    end

    post '/login' do
        mail = params[:mail]
        pwd = params[:pwd]
        # @user = User.new
        # @user.login(mail, pwd)
    end

end