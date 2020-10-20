class CreateSectionTeamings < ActiveRecord::Migration[6.0]
  def change
    create_table :section_teamings do |t|
      t.references :user, foreign_key: true
      t.references :member, foreign_key: { to_table: 'users' }
      t.references :section, foreign_key: true
      t.timestamps
    end
  end
end
