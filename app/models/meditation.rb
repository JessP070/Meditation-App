class Meditation < ApplicationRecord
  belongs_to :technique
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :technique

  def technique_attributes=(attributes)
    technique = Technique.find_or_create_by(attributes) if !name.empty?
  end


end

