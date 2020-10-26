class Notification < ApplicationRecord
  belongs_to :user

  # Validations
  validates :notification_action, notification_target, presence: true
end
