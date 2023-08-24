class ChangeColumnDuck < ActiveRecord::Migration[7.0]
  def change
    change_column :ducks, :available, :boolean, :default => true
    change_column :ducks, :height, :integer, :default => 10
    change_column :ducks, :width, :integer, :default => 10
    change_column :ducks, :depth, :integer, :default => 10
    change_column :ducks, :rating, :integer, :default => 5
  end
end
