class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :text
      t.string :rating
      t.references :participant

      t.timestamps
    end
  end
end
