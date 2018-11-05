require "test_helper"

describe Movie do
  let (:movie) { movies (:rats) }

  it "can be created" do
   expect(movie.valid?).must_equal true
  end

  it "requires title, overview, release_date and inventory" do
    required_fields = [:title, :overview, :release_date, :inventory]

    required_fields.each do |field|
      movie[field] = nil

      expect(movie.valid?).must_equal false

      movie.reload
    end
  end

  it "requires a numnerice inventory count" do
    movie.inventory = "one"

    expect(movie.valid?).must_equal false
  end
end
