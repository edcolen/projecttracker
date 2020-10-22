class Collaboration < ApplicationRecord
  belongs_to :user
  belongs_to :member, class_name: 'User'
  belongs_to :project, class_name: 'Project'
end
