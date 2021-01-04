class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_meditations, through: :reviews, source: :meditation

    has_many :meditations


    validates :username, uniqueness: true, presence: true

    has_secure_password 

    def self.create_by_google_omniauth(auth)
       self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
       end
        
    end


end

