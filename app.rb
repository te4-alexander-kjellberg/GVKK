require_relative 'models/user.rb'
require_relative 'models/guest.rb'
require_relative 'models/db.rb'

class App < Sinatra::Base

    enable :sessions

    before do
        if session[:user_id] == nil
            user = Guest.new
            session[:user_id] = user.id
        end
    end

    get '/' do
        slim :about
    end

    get '/login' do
        slim :login
    end

    post '/login' do
        user_id = User.login(params[:mail], params[:pwd])
        if user_id != 'guest'
            session[:user_id] = user_id
        end
        redirect('/')
    end

    get '/register' do
        redirect back unless session[:user_id] == 'guest'
        slim :register
    end

    post '/register' do
        if User.register(params[:name], params[:phone], params[:adress], params[:mail], params[:pwd1], params[:pwd2], params[:motivation]) == 'success'
        end
        redirect back
    end

    get '/pending' do
        @pending = Dbhandler.get_pending
        slim :pending
    end

    post '/accept_member/:id' do
        user = User.new(params[:id])
        user.change_role('Member')
        redirect('/pending')
    end

end