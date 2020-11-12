class App < Sinatra::Base

    # before do
    #     @db = Dbhandler.get
    # end

    get '/' do
        slim :about
    end

end