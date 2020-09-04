class Review < ApplicationRecord
  belongs_to :meditation
  belongs_to :user
end
