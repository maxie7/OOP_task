require_relative './author.rb'
require_relative './book.rb'
require_relative './order.rb'
require_relative './reader.rb'

class Library
  attr_accessor :authors, :books, :orders, :readers

  def initialize books = [], orders = [], readers = [], authors = []
    @authors = authors
    @books = books
    @orders = orders
    @readers = readers
  end

  def who_often_takes_the_books
    orders = @orders.map {|x| x.reader.name}
    readers_names = Hash.new(0)
    orders.each{ |a| readers_names[a] += 1 }
    often_reader = readers_names.each { |x, y| puts x if y == readers_names.values.max }
  end

  def the_most_popular_book
    orders = @orders.map {|x| x.book.title}
    books_titles = Hash.new(0)
    orders.each{ |a| books_titles[a] += 1 }
    most_popular_book = books_titles.each { |x, y| puts "\"#{x}\"" if y == books_titles.values.max }
  end

  def how_many_people_ordered_one_of_the_three_most_popular_books
    orders = @orders.map {|x| x.book.title}
    books_titles = Hash.new(0)
    orders.map { |a| books_titles[a] += 1 }
    books_titles.sort_by {|x,y| y}
    books_titles.take(3).each {|x,y| puts "\"#{x}\" has been ordered times: #{y}"}
  end

  # def add_author(a_name, bio)
  #   author = Author.new(a_name, bio)
  #   @authors << author
  # end
  #
  # def add_book(title, author)
  #   book = Book.new(title, author)
  #   @books << book
  # end
  #
  # def add_reader(name, email, city, street, house)
  #   reader = Reader.new(name, email, city, street, house)
  #   @readers << reader
  # end
  #
  # def add_order(book, reader, date)
  #   order = Order.new(book, reader, date)
  #   @orders << order
  # end
end
