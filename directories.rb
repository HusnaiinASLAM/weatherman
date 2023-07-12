Dir.chdir "../weatherman_data/"
puts Dir.pwd
puts Dir.glob("*")
Dir.chdir("Dubai_weather")
puts "-----------------"
puts Dir.glob("*")