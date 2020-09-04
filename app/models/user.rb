class User < ApplicationRecord
    has_many :reviews
    has_many :meditations through :reviews
end
