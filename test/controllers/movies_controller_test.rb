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

end
