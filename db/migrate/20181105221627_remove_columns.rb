class RemoveColumns < ActiveRecord::Migration[5.2]
  def change
    remove_columns :rentals, :movie_id
    remove_columns :rentals, :customer_id
  end
end
