require_relative "directories.rb"

class Flaga < Directories
    def initialize(year, city,mon)
        @year = year
        @city = city
        @mon = Date::MONTHNAMES[mon.to_i][0..2]
       
   
        Dir.chdir("../weatherman_data/#{@city}_weather")
      end
    def get_data
    index=0
    highest_temp = 0
    lowest_temp = 0
    high_day = "2011-4-4"
    low_day = "2011-4-4"
    max_humidity = 0
    humidity_day = "2011-4-4"
    Dir.glob("*.txt").each do |file|
      if file.match(/^.*_#{@year}_#{@mon}\.txt$/)
       
        f = File.open(file, "r")
        f.each do |line|
          arr = line.split(",")
          if arr.size > 1 && arr[1].to_i.to_s == arr[1] 
            highest_temp = arr[1].to_i + highest_temp 
            
          index=index+1
            lowest_temp = arr[3].to_i  + lowest_temp
          
            max_humidity = arr[7].to_i  + max_humidity
          end
        end
      end
    end
  
   
    puts "Highest Average: #{highest_temp/index}C "
    puts "Lowest Average: #{lowest_temp/index}C "
    puts "Humidity Average: #{max_humidity/index}% "
  end
end
