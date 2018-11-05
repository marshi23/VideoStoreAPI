class CreatingRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :movie_id, :integer, foreign_key: true
    add_column :rentals, :customer_id, :integer, foreign_key: true
  end
end
