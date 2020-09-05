class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_meditations, through: :reviews, source: :meditation

    has_many :meditations

    validates :username, uniqueness: true, presence: true

    has_secure_password
end
