class SectionTagging < ApplicationRecord
  belongs_to :user
  belongs_to :section
  belongs_to :tag
end
