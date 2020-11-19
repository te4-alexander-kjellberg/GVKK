class User

    def initialize(id)
        @user_data = Dbhandler.get_all(id).first
        @id = id
    end

    # returns the user id if the login is successful, otherwise it will return 'guest'
    def self.login(mail, pwd)
        data = Dbhandler.get_login_data(mail)
        if data.length > 0 && data.first[2] != 'pending'
            if BCrypt::Password.new(data.first[1]) == pwd
                return data.first[0]
            end
        end
        @msg = 'login failed'
        return 'guest'
    end

    def self.register(name, phone, adress, mail, pwd1, pwd2, motivation)
        if User.exist?(mail)
            return "Den angivna mailadressen används redan!"
        elsif pwd1 != pwd2
            return "Lösenorden matchar inte!"
        end
        pwdhash = BCrypt::Password.create(pwd1)
        Dbhandler.member_request(name, phone, adress, mail, pwdhash, motivation)
        return true
    end

    def self.exist?(mail)
        if Dbhandler.get_login_data(mail).length > 0
            return true
        end
        return false
    end

    def change_role(new_role)
        Dbhandler.change_role(@id, new_role)
    end

    def id
        @id
    end

    def name
        @name
    end

    def mail
        @mail
    end

    def adress
        @adress
    end

    def pwdhash
        @pwdhash
    end

    def img_path
        @img_path
    end

    def join_date
        @join_date
    end

    def phone
        @phone
    end

    def role
        @role
    end

    def hardest_boulder
        @hardest_boulder
    end

    def hardest_lead
        @hardest_lead
    end

end