class MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json:  movies.as_json(only: [:id, :title, :release_date]), status: :ok
  end

  def show
  movie = Movie.find_by(id: params[:id])
  render json:  movie.as_json(only: [:title, :review, :release_date, :inventory]), status: :ok
  end

  def create
    movie = Movie.new(movie_params)
    movie.save!
    render json: { id: movie.id }, status: :ok
  end
end



private
def movie_params
  params.require(:movie).permit(:title, :overview, :release_date, :inventory)
end
