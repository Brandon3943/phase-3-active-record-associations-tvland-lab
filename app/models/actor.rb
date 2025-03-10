require "pry"

class Actor < ActiveRecord::Base
    #Actor -< characters >- shows
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        self.characters.map do |character|
            "#{character.name} - #{character.show.name}"
        end
    end
end