class Card < ApplicationRecord
  belongs_to :user
  belongs_to :section
  belongs_to :project, through: :sections
  belongs_to :leader, class_name: 'User'
  belongs_to :color

  has_many :comments
  has_many :card_taggings
  has_many :card_teamings

  # Validations
  validates :title, :status, presence: true
end
