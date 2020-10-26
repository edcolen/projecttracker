class Response < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  # Validations
  validates :content, presence: true
end
