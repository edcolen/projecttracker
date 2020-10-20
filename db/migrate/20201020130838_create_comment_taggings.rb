class CreateCommentTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_taggings do |t|

      t.timestamps
    end
  end
end
