class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.string :uuid
      t.string :color
      t.string :username

      t.timestamps
    end
  end
end
