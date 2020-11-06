class Project < ApplicationRecord
  belongs_to :user

  has_many :sections, dependent: :destroy
  has_many :cards, through: :sections, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :members, through: :collaborations, dependent: :destroy
  has_many :privileges, dependent: :destroy
  has_many :admins, through: :privileges, dependent: :destroy

  # Validations
  validates :title, presence: true
end
