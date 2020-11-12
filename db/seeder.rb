require 'sqlite3'

class Seeder

    def initialize
        @db = SQLite3::Database.new('le_dat.db')
        drop_tables()
        create_tables()
        add_data()
    end

    def drop_tables
        @db.execute("DROP TABLE IF EXISTS users;")
        puts "Dropped tables..."
    end

    def create_tables
        @db.execute("CREATE TABLE users (
            id INTEGER PRIMARY KEY NOT NULL UNIQUE, 
            name TEXT NOT NULL, 
            mail TEXT, 
            adress TEXT, 
            pwdhash TEXT NOT NULL, 
            imgpath TEXT, 
            join_date TEXT, 
            phone TEXT, 
            role TEXT NOT NULL, 
            hardest_boulder TEXT, 
            hardest_lead TEXT
            );")
        puts "Created tables..."
    end

    def add_data
        @db.execute("INSERT INTO users (name, pwdhash, role) 
        VALUES('Guest', 'guestpass', 'guest');")
        @db.execute("INSERT INTO users (name, mail, adress, pwdhash, imgpath, join_date, phone, role, hardest_boulder, hardest_lead) 
        VALUES('Alexander Kjellberg', '01Alexanderkjellberg@gmail.com', 'Norra Källåsvägen 35', 'hej', 'alexander_kjellberg_profile.jpg', 'När klubben startades', '0769463848', 'Ledj', '7B', '7b+');")
        puts "Added standardized users"
    end

end

Seeder.new