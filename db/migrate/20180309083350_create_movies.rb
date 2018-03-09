class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :date_of_premiere
      t.integer :duration
      t.string :description
      t.string :movie_type
      t.string :director
      t.string :screenwriter
      t.string :country
    end
  end
end
