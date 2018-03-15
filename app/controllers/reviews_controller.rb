class ReviewsController < ApplicationController
  def create
    @movie=Movie.find(params[movie_id])
  end


end
