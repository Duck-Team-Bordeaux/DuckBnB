class AddReferenceToDucks < ActiveRecord::Migration[7.0]
  def change
    add_reference :ducks, :users, null: false, foreign_key: true
  end
end
