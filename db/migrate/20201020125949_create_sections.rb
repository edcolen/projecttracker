class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.references :leader, foreign_key: { to_table: 'users' }
      t.references :color, foreign_key: true
      t.string :title, null: false
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
