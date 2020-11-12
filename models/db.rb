class Dbhandler

    def initialize
        @db = SQLite3::Database.new('db/le_dat.db')

    end

end