class CreateCardTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :card_taggings do |t|
      t.references :user, foreign_key: true
      t.references :card, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
