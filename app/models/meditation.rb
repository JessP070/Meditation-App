class Meditation < ApplicationRecord
  belongs_to :technique
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews, :dependent => :destroy


  accepts_nested_attributes_for :technique

  validates :mood, presence: true
  validate :not_a_duplicate

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}


  def self.alpha
    order(:mood)
  end

  def technique_attributes=(attributes)
    self.technique = Technique.find_or_create_by(attributes) if !attributes['name'].empty?
    self.technique
  end


  def not_a_duplicate
    if Meditation.find_by(mood: mood, technique_id: technique_id)
      errors.add(:mood, "Has already been added for that technique")
    end
  end

  def technique_name
  technique.try(:name)
  end 

  def mood_and_technique
    "#{mood} - #{technique.name}"
  end
  
 
end

