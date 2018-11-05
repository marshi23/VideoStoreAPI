require "test_helper"

describe Customer do
  let(:customer) { customers (:one) }

  it "must be valid" do
    value(customer).must_be :valid?
  end

  it 'must have required fields' do
    fields = [:name, :registered_at,:address, :city, :state, :postal_code, :phone]
    fields.each do |field|
      expect(customer).must_respond_to field
    end

  end
end
