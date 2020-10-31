class Project < ApplicationRecord
  belongs_to :user

  has_many :sections
  has_many :cards, through: :sections
  has_many :tags, through: :section_taggings
  has_many :collaborations
  has_many :members, through: :collaborations
  has_many :privileges
  has_many :admins, through: :privileges

  # Validations
  validates :title, presence: true
end
