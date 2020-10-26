class CardTagging < ApplicationRecord
  belongs_to :user
  belongs_to :card
  belongs_to :tag
end
