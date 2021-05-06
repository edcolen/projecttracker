class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card
  delegate :section, to: :card
  delegate :project, to: :card

  has_many :responses
  has_many :comment_taggings, dependent: :destroy
  has_many :tags, through: :comment_taggings, dependent: :destroy

  # Validations
  validates :content, presence: true
end
