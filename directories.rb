require "date"


class Directories
  def initialize(year, city)
    @year = year
    @city = city
    Dir.chdir("../weatherman_data/#{@city}_weather")
  end

  
end
