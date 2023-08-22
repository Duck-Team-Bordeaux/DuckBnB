class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthdate, :date
    add_column :users, :credit_card, :integer
    add_column :users, :rib, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
    add_column :users, :location, :string
  end
end
