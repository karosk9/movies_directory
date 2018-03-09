class Movie < ApplicationRecord
  validates :name, :date_of_premiere
  has_one :director
  has_one :screenwriter
end
