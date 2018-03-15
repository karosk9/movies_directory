class Movie < ApplicationRecord
  validates :title, presence: true

  def movie_types=(text)
    text.is_a?(String) ? super(sanitize_movie_types(text)) : super(text)
  # jeśli text jest stringiem wywołuje metodę sanitize tags która zmienia string na array, jeśli nie jest stringiem nie wykona się
  end

  private

  def sanitize_movie_types(text)
    text.split(" ").map(&:downcase).uniq
  end

end
