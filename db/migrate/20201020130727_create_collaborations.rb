class CreateCollaborations < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborations do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.boolean :member, default: true
      t.string :role
      t.timestamps
    end
  end
end
