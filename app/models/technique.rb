class Technique < ApplicationRecord
    has_many :meditations

    # validates :name, presence: true, uniqueness: true
end


