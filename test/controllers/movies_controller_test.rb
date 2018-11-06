require "test_helper"

describe MoviesController do
  describe 'index' do
    it 'succeeds' do
      get movies_path

      must_respond_with :success
    end
  end

  describe 'show' do
    it 'succeeds given a valid ID' do
      get movies_path(:id)

      must_respond_with :success
    end
  end

  describe 'create' do
    let(:movie_hash) do
    {
      movie: {
        title: 'Eternal sunshine of the Spotless Mind',
        overview: 'Kate Winslet and Jim Carrey',
        release_date: '2012-11-25',
        inventory: "3"
      }
    }
  end
    it 'creates a movie given correct params' do
      expect {
        post movies_path, params: movie_hash
      }.must_change 'Movie.count', 1

      must_respond_with :ok
    end

  end
end
