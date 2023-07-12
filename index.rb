require_relative "directories.rb"
require_relative "Data.rb"

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
      if flag == "-cc"
        raise Exception, "Invalid entry for month" if ARGV[1].split("/")[1].to_i > 12 || ARGV[1].split("/")[1].to_i < 1
      end
      dir = Flage.new(year, city)

      case flag
      when "-e"
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
