class Customer < ApplicationRecord
  has_many :rentals, :foreign_key => :customer_id
  before_save :movies_checked_out_count

  validates :name, presence: true
  validates :registered_at, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :phone, presence: true

  def movies_checked_out_count
    movies_count = self.rentals

    if movies_count.empty?
      return 0
    else
      return movies_count.length
    end
  end

end
