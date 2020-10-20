class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :notification_action, null: false
      t.string :notification_target, null: false
      t.timestamps
    end
  end
end
