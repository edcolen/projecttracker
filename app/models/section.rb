class Section < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :leader, class_name: 'User'
  belongs_to :color

  has_many :cards
  has_many :section_teamings
  has_many :section_taggings

  # Validations
  validates :title, presence: true
end
