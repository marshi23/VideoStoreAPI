class Remove < ActiveRecord::Migration[5.2]
  def change
      remove_column :rentals, :checkin_date
  end
end
