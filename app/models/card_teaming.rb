class CardTeaming < ApplicationRecord
  belongs_to :user
  belongs_to :member, class_name: 'User'
  belongs_to :card
end
