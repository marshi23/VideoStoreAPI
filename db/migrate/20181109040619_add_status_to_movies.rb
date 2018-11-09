class AddStatusToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :status, :string, :default => :available
  end
end
