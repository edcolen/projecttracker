class Tag < ApplicationRecord
  has_many :section_taggings
  has_many :cards, through: :section_taggings
  has_many :card_taggings
  has_many :comment_taggings

  # Validations
  validates :name, presence: true
end
