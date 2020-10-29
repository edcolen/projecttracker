class Project < ApplicationRecord
  belongs_to :user

  has_many :sections
  has_many :cards, through: :sections
  has_many :tags, through: :section_taggings
  has_many :collaborations

  # Validations
  validates :title, presence: true
end
