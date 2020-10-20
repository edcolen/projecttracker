class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true
      t.references :section, foreign_key: true
      t.references :leader, foreign_key: { to_table: 'users' }
      t.references :color, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :priority
      t.string :status
      t.string :category
      t.timestamps
    end
  end
end
