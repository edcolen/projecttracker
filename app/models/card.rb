class Card < ApplicationRecord
  belongs_to :user
  belongs_to :leader, class_name: 'User'
  belongs_to :section
  belongs_to :color

  has_many :comments
  has_many :card_teamings
  has_many :members, through: :card_teamings
  has_many :card_taggings
  has_many :tags, through: :card_taggings
  has_many :comment_taggings
  has_many :comment_tags, through: :comment_taggings

  # Validations
  validates :title, :status, presence: true
end
