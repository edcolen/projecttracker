class CreateCollaborations < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborations do |t|
      t.references :user, foreign_key: true
      t.references :member, foreign_key: { to_table: 'users' }
      t.references :project, foreign_key: true
      t.string :role
      t.timestamps
    end
  end
end
