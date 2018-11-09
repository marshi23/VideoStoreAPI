require "test_helper"

describe Movie do
  describe 'valid' do

    let (:movie) { movies (:one) }

    it "can be created" do
      expect(movie.valid?).must_equal true
    end

    it "requires title, overview, release_date and inventory" do
      required_fields = [:title, :overview, :release_date, :inventory]

      required_fields.each do |field|


        expect(movie.valid?).must_equal true

        movie.reload
      end
    end

    it "will fail with invalid or missing information " do
      required_fields = [:title, :overview, :release_date, :inventory]

      required_fields.each do |field|
        movie[field] = nil

        expect(movie.valid?).must_equal false

        movie.reload
      end
    end


    it "requires a numeric inventory count" do
      movie.inventory = "one"
      expect(movie.valid?).must_equal false
    end
  end

  describe "relationships" do
    let (:movie) { movies (:one) }

    it "has rentals" do

       movie.rentals.new

      expect (movie.rentals.length).must_be :>=, 1

    end
  end
end
