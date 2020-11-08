class Section < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :leader, class_name: 'User', optional: true
  belongs_to :color

  has_many :cards, dependent: :destroy
  has_many :section_teamings, dependent: :destroy
  has_many :members, through: :section_teamings, dependent: :destroy
  has_many :section_taggings, dependent: :destroy
  has_many :tags, through: :section_taggings, dependent: :destroy

  # Validations
  validates :title, presence: true
end
