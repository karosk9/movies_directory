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
    if current_user.admin?
      @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to movies_path
      else
        render 'new'
      end
    else
      redirect_to movies_path, notice: 'You have no permition to add the movie'
    end
  end

  def show
    # binding.pry
    @review = Review.new(reviewer: session[:reviewer])
  end

  def edit
    redirect_to movies_path unless current_user.admin?
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
