class DropScreenwriterFromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :screenwriter, :string

  end
end
