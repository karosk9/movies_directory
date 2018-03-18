class RemoveFieldDateOfPremiereFromTableMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :date_of_premiere, :date
    add_column :movies, :date_of_premiere, :integer
  end
end
