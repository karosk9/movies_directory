class MoviesController < ApplicationController
before_action :provide_movie, only: [:show, :edit, :update, :destroy]
before_action :movie_params, only: [:update]
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    # redirect_to movies_path if current_user != @movie.user
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, notice: 'Movie was successfully deleted.'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :date_of_premiere, :movie_types, :country, :director, :duration)
  end

  def provide_movie
    @movie = Movie.find(params[:id])
  end

end
