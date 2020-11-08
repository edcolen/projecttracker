class Card < ApplicationRecord
  belongs_to :user
  belongs_to :leader, class_name: 'User', optional: true
  belongs_to :section
  belongs_to :color

  has_many :comments, dependent: :destroy
  has_many :card_teamings, dependent: :destroy
  has_many :members, through: :card_teamings, dependent: :destroy
  has_many :card_taggings, dependent: :destroy
  has_many :tags, through: :card_taggings, dependent: :destroy
  has_many :comment_taggings, dependent: :destroy
  has_many :comment_tags, through: :comment_taggings, dependent: :destroy

  # Validations
  validates :title, :status, presence: true
end
