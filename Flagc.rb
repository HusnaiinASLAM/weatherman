require_relative "directories.rb"

class Flagc < Directories
  def initialize(year, city, mon)
    @year = year
    @city = city
    @mon = Date::MONTHNAMES[mon.to_i][0..2]
    Dir.chdir("../weatherman_data/#{@city}_weather")
  end

  def get_data
    index = 1
    h_temp = 0
    l_temp = 0
    Dir.glob("*.txt").each do |file|
      if file.match(/^.*_#{@year}_#{@mon}\.txt$/)
        f = File.open(file, "r")
        puts ""
        puts "\e[33m" + "*" * 30 + "  #{@mon} #{@year} Temperature Chart  " + "*" * 30 + "\e[0m"
        puts ""
        f.each do |line|
          arr = line.split(",")
          if arr.size > 1 && arr[1].to_i.to_s == arr[1]
            h_temp, l_temp = arr[1].to_i, arr[3].to_i
  

            if h_temp > 0
              print "\e[31m%02d\e[0m  " % index
              print "\e[31m+\e[0m" * h_temp
              puts "  #{h_temp}\u00B0C"
            elsif h_temp < 0
              print "\e[31m%02d\e[0m  " % index
              puts "  -#{h_temp}\u00B0C"
            else
              print "\e[31m%02d\e[0m  " % index
              puts "   #{h_temp}\u00B0C"
            end
            
            if l_temp > 0
              print "\e[34m%02d\e[0m  " % index
              print "\e[34m+\e[0m" * l_temp
              puts "  #{l_temp}\u00B0C"
            elsif l_temp < 0
              print "\e[34m%02d\e[0m  " % index
              puts " -#{l_temp}\u00B0C"
            else
              print "\e[34m%02d\e[0m  " % index
              puts "   #{l_temp}\u00B0C"
            end
            index = index + 1
          end

          
        end
      end
    end
  end
end
