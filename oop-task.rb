require_relative './structure.rb'
require_relative './library.rb'

puts "Openning file..."
  begin
    library = Marshal.load(File.binread('result.sav'))
  rescue
    puts 'Failed.'
    library = db
    puts "Loaded default."
  else
    puts "Ok."
  end

puts
puts "Reader who often takes the books: #{library.who_ottb}"
puts
puts "The most popular book: \"#{library.the_most_pb}\""
puts
puts "How many people who ordered one of the three popular books: \n #{library.how_many_pooottmpb}"
puts

puts "All data has been saved to the file!"
  begin
    File.open('result.sav', 'wb') {|f| f.write(Marshal.dump(library))}
    puts "Done!"
  end

puts
