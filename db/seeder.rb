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
            hardest_lead TEXT, 
            motivation TEXT
            );")
        puts "Created tables..."
    end

    # pwd for Alexander Kjellberg is 'hej'
    def add_data
        @db.execute("INSERT INTO users (name, mail, adress, pwdhash, imgpath, join_date, phone, role, hardest_boulder, hardest_lead) 
        VALUES('Alexander Kjellberg', '01Alexanderkjellberg@gmail.com', 'Norra Källåsvägen 35', '$2a$12$7uVGg4XuvjqwQZEivhSKMus6nX7qoFmk7vNkRCS.nGIz2sl1FsU82', 'alexander_kjellberg_profile.jpg', 'När klubben startades', '0769463848', 'Ledj', '7B', '7b+');")
        @db.execute("INSERT INTO users (name, mail, adress, pwdhash, phone, role, motivation) 
        VALUES('Bert Karlsson', 'minmail@gmail.com', 'Taket 24', '$2a$12$7uVGg4XuvjqwQZEivhSKMus6nX7qoFmk7vNkRCS.nGIz2sl1FsU82', '0769463848', 'pending', 'Jag är en sjuk jävel på pranks!');")
        @db.execute("INSERT INTO users (name, mail, adress, pwdhash, phone, role, motivation) 
        VALUES('Stefan Brandt', 'karlile@gmail.com', 'Norrmalmstorg 85', '$2a$12$7uVGg4XuvjqwQZEivhSKMus6nX7qoFmk7vNkRCS.nGIz2sl1FsU82', '123456789', 'pending', 'Jag vil vara med i en cool klubb och bli ledj!');")
        puts "Added standardized users"
    end

end

Seeder.new