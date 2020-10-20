class CreateSectionTeamings < ActiveRecord::Migration[6.0]
  def change
    create_table :section_teamings do |t|
      t.references :user, foreign_key: true
      t.references :section, foreign_key: true
      t.boolean :member, default: false
      t.timestamps
    end
  end
end
