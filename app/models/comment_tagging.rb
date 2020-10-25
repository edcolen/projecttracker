class CommentTagging < ApplicationRecord
  belongs_to :comment
  belongs_to :tag
end
