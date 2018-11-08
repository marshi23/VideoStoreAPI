require "test_helper"

describe MoviesController do
  describe 'index' do
    it 'succeeds' do
      #Act
      get movies_path
      #Assert
      expect(response.header['Content-Type']).must_include 'json'
      must_respond_with :success
    end

    it'returns an Array' do
      get movies_path

      body = JSON.parse(response.body)

      expect(body).must_be_kind_of Array
    end

    it "returns all of the movies" do
      # Act
      get movies_path

      body = JSON.parse(response.body)

      # Assert
      expect(body.length).must_equal Movie.count
    end
  end

  describe 'show' do
    it 'succeeds given a valid ID' do
      get movies_path(:id)

      must_respond_with :success
    end

    it 'can get a movie with a valid info' do
      get movies_path(movies(:two).id)
      must_respond_with :success
    end

    it "responds with a not_found if no movie with that id exists" do
      id = -1

      get movie_path(id)

      must_respond_with :not_found
    end
  end


  describe 'create' do
    let (:movie_hash) do
      {
          title: 'Eternal sunshine of the Spotless Mind',
          overview: 'Kate Winslet and Jim Carrey',
          release_date: '2012-11-25',
          inventory: "3"
        }

    end

    it 'creates a movie given correct params' do
      expect{
      post movies_path, {:params => movie_hash}
      }.must_change 'Movie.count', 1

    end
    it 'has an overview' do
      post movies_path(movie_hash)

      body = JSON.parse(response.body)

      body.must_include 'overview'
      #
      # body.each do |movie|
      #   movie(body).must_include 'overview'
      end
    end
  end
