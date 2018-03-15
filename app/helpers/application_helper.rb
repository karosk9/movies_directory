module ApplicationHelper
  def select_year
    select_year(Date.today, start_year: 2005, end_year: 1900)
  end
end
