class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :notification_action
      t.string :notification_target
      t.timestamps
    end
  end
end
