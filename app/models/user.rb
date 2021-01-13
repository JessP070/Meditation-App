class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_meditations, through: :reviews, source: :meditation
    #a user has many reviewed meditations---> and can create reviews on any meditation including their own


    has_many :meditations #referring to a user who has created many meditations

    validates :username, uniqueness: true, presence: true

    has_secure_password 

    def self.create_by_google_omniauth(auth)
       self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
       end
        
    end


end

