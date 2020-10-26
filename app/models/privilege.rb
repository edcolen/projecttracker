class Privilege < ApplicationRecord
  belongs_to :user
  belongs_to :admin, class_name: 'User'
  belongs_to :project
end
