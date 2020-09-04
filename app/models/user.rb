class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_meditations, through: :reviews, source: :meditation

    has_many :meditations
end
