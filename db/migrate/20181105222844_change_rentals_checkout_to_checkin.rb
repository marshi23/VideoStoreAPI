class ChangeRentalsCheckoutToCheckin < ActiveRecord::Migration[5.2]
  def change
    rename_column :rentals, :checkout_date, :checkin_date

  end
end
