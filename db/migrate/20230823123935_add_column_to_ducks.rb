class AddColumnToDucks < ActiveRecord::Migration[7.0]
  def change
    add_column :ducks, :url, :string
    add_column :ducks, :rating, :integer
  end
end
