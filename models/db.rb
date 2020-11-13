class Dbhandler

    def self.get
        SQLite3::Database.new('db/le_dat.db')
    end

    def self.get_login_data(mail)
        get.execute("SELECT id, pwdhash, role FROM users WHERE mail = ?;", mail)
    end

    def self.member_request(name, phone, adress, mail, pwdhash, motivation)
        get.execute("INSERT INTO users (name, mail, adress, pwdhash, phone, role, motivation) VALUES (?, ?, ?, ?, ?, ?, ?);", name, mail, adress, pwdhash, phone, 'pending', motivation)
    end

    def self.get_user_data(column, id)
        get.execute("SELECT #{column} FROM users WHERE id = ?;", id)
    end

    def self.get_all(id)
        get.execute("SELECT * FROM users WHERE id = ?;", id)
    end

    def self.get_pending
        get.execute("SELECT id, name, motivation FROM users WHERE role = 'pending'")
    end

    def self.change_role(id, new_role)
        get.execute("UPDATE users SET role = ? WHERE id = ?;", new_role, id)
    end

end