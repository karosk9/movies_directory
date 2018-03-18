class ReviewsController < ApplicationController
  before_action :provide_movie, only: [:create, :destroy]
  def create
    # @review = Review.new(review_params.merge(movie: @movie))
    # binding.pry
    @review = @movie.reviews.create(params[:review_id])
    @review.reviewer = current_user.email
    byebug
    if @review.save
      session[:reviewer]= @review.reviewer
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  def destroy
    @review.destroy
    redirect_to show_movie_path(@movie), notice: 'review destroyed'
  end

  private
  def review_params
    params.require(:review).permit(:reviewer, :body, :movie_id)
  end

  def provide_movie
    @movie = Movie.find(params[:movie_id])
  end

end
