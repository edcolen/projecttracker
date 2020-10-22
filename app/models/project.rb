class Project < ApplicationRecord
  has_many :sections
  has_many :cards, through: :sections
  has_many :tags, through: :section_taggings
  has_many :collaborations, class_name: 'Collaboration', foreign_key: 'project_id'

  # Validations
  validates :title, presence: true
end
