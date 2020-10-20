class CreateSectionTeamings < ActiveRecord::Migration[6.0]
  def change
    create_table :section_teamings do |t|

      t.timestamps
    end
  end
end
