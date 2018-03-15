class RemoveRefereceDirectorFromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :director_id, :index
    add_column :movies, :director, :string
  end
end
