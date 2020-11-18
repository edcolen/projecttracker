class CreateCommentTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_taggings do |t|
      t.references :card, foreign_key: true
      t.references :comment, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
