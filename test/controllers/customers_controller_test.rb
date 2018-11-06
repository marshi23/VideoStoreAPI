require "test_helper"

describe CustomersController do
  describe "index" do

    it "is a real working route" do
      get customers_path
      must_respond_with :success
    end

    it "returns json" do
      get customers_path

      expect(response.header['Content-Type']).must_include 'json'
    end

    it "returns an array" do
      get customers_path

      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    it "returns all the customers" do
      get customers_path

      body = JSON.parse(response.body)
      body.length.must_equal Customer.count
    end

    it "returns customers with exactly the required fields" do
      fields = [ 'name', 'phone', 'postal_code', 'movies_checked_out_count', 'id', 'registered_at']
      fields = fields.sort!

      get customers_path
      body = JSON.parse(response.body)

      body.each do |customer|
        customer.keys.sort.must_equal fields
      end
    end
  end

  
end
