require "date"

class Flage < Directories
  def initialize(year, city)
    @year = year
    @city = city
    Dir.chdir("../weatherman_data/#{@city}_weather")
  end

  def get_data
    highest_temp = -999
    lowest_temp = 999
    high_day = nil
    low_day = nil
    max_humidity = -999
    humidity_day = nil

    Dir.glob("*.txt").each do |file|
      if file.match(/^.*_#{@year}_.*\.txt$/)
        f = File.open(file, "r")
        f.each do |line|
          arr = line.split(",")
          if arr.size > 1 && arr[3].to_i.to_s == arr[3] && arr[1].to_i > highest_temp
            highest_temp = arr[1].to_i 
            high_day = arr[0]
          end
          if arr.size > 1 && arr[3].to_i.to_s == arr[3] && arr[3].to_i < lowest_temp
            lowest_temp = arr[3].to_i 
            low_day = arr[0]
          end
          if arr.size > 1 && arr[3].to_i.to_s == arr[3] && arr[7].to_i > max_humidity
            max_humidity = arr[7].to_i  
            humidity_day = arr[0]
          end
        end
      end
    end

    begin
      h_month = Date::MONTHNAMES[high_day.split("-")[1].to_i] 
      h_date = high_day.split("-")[2].to_i
      l_month = Date::MONTHNAMES[low_day.split("-")[1].to_i] 
      l_date = low_day.split("-")[2].to_i

      humidity_month = Date::MONTHNAMES[humidity_day.split("-")[1].to_i]
      humidity_date = humidity_day.split("-")[2].to_i 

      puts "Highest: #{highest_temp}C on #{h_month} #{h_date}"
      puts "Lowest: #{lowest_temp}C on #{l_month} #{l_date}"
      puts "Humidity: #{max_humidity}% on #{humidity_month} #{humidity_date}"
    rescue Exception => e
      puts "File doesn't exist"
    end
  end
end
