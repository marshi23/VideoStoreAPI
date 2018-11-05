class Customer < ApplicationRecord
  has_many :rentals, :foreign_key => :customer_id
  
end
