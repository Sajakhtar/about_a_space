class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :space
      t.string :title
      t.text :description
      t.string :address
      t.float :price
      t.integer :capacity
      t.boolean :wifi
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
