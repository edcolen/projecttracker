class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  # Validations
  validates :content, presence: true
end
