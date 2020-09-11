class Meditation < ApplicationRecord
  belongs_to :technique
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :technique

  validates :mood, presence: true
  validate :not_a_duplicate

  def technique_attributes=(attributes)
    technique = Tehnique.find_or_create_by(attributes) if
    !attributes['name'].empty?
  end

  def not_a_duplicate
    if Meditation.find_by(mood: mood, tecnique_id: technique_id)
      errors.add(:discount:mood, "Has already been added for that technique")
    end
  end

end

