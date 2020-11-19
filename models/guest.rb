class Guest

    def initialize
        @id = 'guest'
        @name = 'Guest'
        @mail = ''
        @adress = ''
        @pwdhash = ''
        @img_path = 'standard_user.jpg'
        @join_date = ''
        @phone = ''
        @role = 'Guest'
        @hardest_boulder = ''
        @hardest_lead = ''
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