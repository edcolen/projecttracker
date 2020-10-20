class CreateCardTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :card_taggings do |t|

      t.timestamps
    end
  end
end
