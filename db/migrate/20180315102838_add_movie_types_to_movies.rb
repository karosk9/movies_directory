class AddMovieTypesToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :movie_types, :text, array:true, default:[]
  end
end
