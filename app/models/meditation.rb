class Meditation < ApplicationRecord
  belongs_to :technique
  belongs_to :user #creator of it
  has_many :reviews
  has_many :users, through: :reviews, :dependent => :destroy 
#have many users who have reviewed a specific meditation through reviews
  accepts_nested_attributes_for :technique

  validates :mood, presence: true
  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}
  scope :starts_with, -> {where("mood LIKE ?", "A%")}

  # def self.starts_with(a)
  #   self.where("mood LIKE ?", "A%")
  # end

  def self.alpha
    order(:mood)
  end

  def technique_attributes=(attributes)
      self.technique = Technique.find_or_create_by(attributes) if !attributes['name'].empty?
      self.technique
    end


  def technique_name
  technique.try(:name)
  end 

  def mood_and_technique
    "#{mood} - #{technique.name}"
  end
  
 
end

