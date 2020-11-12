class User

    def initialize
        @id = 1
        @name = 'Guest'
    end

    def login(mail, pwd)
        puts "#####################################################"
        puts "entered #{mail} and #{pwd}"
    end

    def get
        SQLite3::Database.new('db/le_dat.db').execute("SELECT id, name, role FROM users WHERE name = ?;", @id)
    end

end