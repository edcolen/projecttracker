class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true
      t.references :section, foreign_key: true
      t.references :leader, foreign_key: { to_table: 'users' }
      t.references :color, foreign_key: true
      t.string :title, null: false
      t.string :description
      t.string :priority
      t.string :status
      t.string :category
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
