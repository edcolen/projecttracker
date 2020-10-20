class CreateSectionTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :section_taggings do |t|

      t.timestamps
    end
  end
end
