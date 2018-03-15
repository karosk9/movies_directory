class DropMovieTypeFromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :movie_type, :string
  end
end
