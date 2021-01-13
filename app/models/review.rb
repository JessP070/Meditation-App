class Review < ApplicationRecord
  belongs_to :user
  belongs_to :meditation
  
  validates :title, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

  validates :meditation, uniqueness: {scope: :user, message: "has already been reviewed by you"}

 scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

end
