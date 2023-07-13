require_relative "directories.rb"
require_relative "Flage.rb"
require_relative "Flagc.rb"
require_relative "Flaga.rb"
require_relative "Flagcc.rb"

class Index
  def start
    begin
      cities = ["dubai", "lahore", "murree"]
      flags = ["-e", "-a", "-c", "-cc"]
      years = (2004..2016).to_a
      flag = ARGV[0]
      year = ARGV[1]
      city = ARGV[2]
      raise Exception, "Invalid number of arguments" if ARGV.length != 3
      raise Exception, "Invalid flag" if !flags.include?(flag)
      raise Exception, "City data doesn't exist" if !cities.include?(city)
      raise Exception, "Data of that year is not present" if !years.include?(year.to_i)
      if flag == "-cc" || flag == "-c" || flag == "-a"
        raise Exception, "Please give the value of month. (year/month)" if year.split("/").size < 2
        raise Exception, "Invalid entry for month" if ARGV[1].split("/")[1].to_i > 12 || ARGV[1].split("/")[1].to_i < 1
      end
      

      case flag
      when "-e"
        dir = Flage.new(year, city)
        dir.get_data
      
      when "-c"
        month = year.split("/")[1]
        year = year.split("/")[0]
        
        dir = Flagc.new(year,city,month)
        dir.get_data
      when "-a"
        month = year.split("/")[1]
        year = year.split("/")[0]
        
        dir = Flaga.new(year,city,month)
        dir.get_data
      when "-cc"
        month = year.split("/")[1]
        year = year.split("/")[0]
        
        dir = Flagcc.new(year,city,month)
        dir.get_data
      end
      
    rescue Exception => e
      puts e.backtrace.inspect + "  "
      puts e.message
    end
  end
end

ter = Index.new
ter.start
