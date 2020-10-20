class CreatePrivileges < ActiveRecord::Migration[6.0]
  def change
    create_table :privileges do |t|
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: { to_table: 'users' }
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
