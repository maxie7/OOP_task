require_relative './db'
require_relative './library'

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

puts ""

puts "Reader who often takes the books: "
library.who_often_takes_the_books
puts ""

puts "The most popular book: "
library.the_most_popular_book
puts ""

puts "The Amount of people who ordered three popular books"
library.how_many_people_ordered_one_of_the_three_most_popular_books
puts ""

puts "All data has been saved to the file!"
  begin
    File.open('result.sav', 'wb') {|f| f.write(Marshal.dump(library))}
    puts "Done!"
  end

puts ""
