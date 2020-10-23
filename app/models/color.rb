class Color < ApplicationRecord
  validates :name, presence: true
  validates :hexcode, presence: true

  has_many :sections
  has_many :cards
end
