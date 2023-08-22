class CreateDucks < ActiveRecord::Migration[7.0]
  def change
    create_table :ducks do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :category
      t.boolean :available
      t.integer :height
      t.integer :width
      t.integer :depth

      t.timestamps
    end
  end
end
