class Color < ApplicationRecord
  has_many :sections
  has_many :cards

  # Validations
  validates :name, :hexcode, presence: true
end
