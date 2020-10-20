class CreatePrivileges < ActiveRecord::Migration[6.0]
  def change
    create_table :privileges do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
