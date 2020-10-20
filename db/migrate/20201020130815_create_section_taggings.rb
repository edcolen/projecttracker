class CreateSectionTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :section_taggings do |t|
      t.references :user, foreign_key: true
      t.references :section, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
