begin
    cities= ["dubai","lahore","murree"]
    flags= ["-e","-a","-c","-cc"]
    years = (2004..2016).to_a
    raise Exception,"Invalid number of arguments" if ARGV.length != 3
    raise Exception,"Invalid flag" if cities.include?(ARGV[0])
    raise Exception,"City data doesn't exist" if !cities.include?(ARGV[2])
    raise Exception,"Data of that year is not present" if !years.include?(ARGV[1])
    if( ARGV[0] == "-cc")
        raise Exception,"Invalid entry for month" if ARGV[1].split("/")[1].to_i > 12 || ARGV[1].split("/")[1].to_i < 1
    end
   






rescue Exception => e 
    print e.backtrace.inspect+"  "
    puts e.message


end
