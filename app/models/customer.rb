class Customer < ApplicationRecord
  has_many :rentals, :foreign_key => :customer_id

  validates :name, presence: true
  validates :registered_at, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :phone, presence: true

  # def movies_checked_out_count
  #   self[:movies_checked_out_count] || 0
  # end
end
