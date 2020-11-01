class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  has_many :responses

  # Validations
  validates :content, presence: true
end
