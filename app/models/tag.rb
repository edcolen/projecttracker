class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :section_taggings
  has_many :card_taggings
  has_many :comment_taggings
end
