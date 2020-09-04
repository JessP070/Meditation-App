class Meditation < ApplicationRecord
  belongs_to :technique
  belongs_to :user
end
