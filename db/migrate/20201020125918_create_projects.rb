# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
