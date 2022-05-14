class Role < ActiveRecord::Base
    has_many :auditions

    def lead
        Audition.where({role_id: self.id, hired: true}).first || "no actor has been hired for this role"
    end

    def understudy
        Audition.where({role_id: self.id, hired: true}).second || "no actor has been hired for understudy for this role"
    end

    def actors
        self.auditions.map do |a|
            a.actor
        end
    end

    def locations
        self.auditions.map do |a|
            a.location
        end
    end
end