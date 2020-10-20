class CreateCardTeamings < ActiveRecord::Migration[6.0]
  def change
    create_table :card_teamings do |t|

      t.timestamps
    end
  end
end
