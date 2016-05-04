require_relative './structure.rb'
require_relative './db'

class Library
  include Enumerable

  attr_accessor :books, :orders, :readers, :authors

  def initialize books, orders, readers, authors
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  #who often takes the book
  def who_ottb
    often_reader = @orders.group_by{|x| x.reader}.sort_by {|x,y| y.length}.last[0].name
  end
  # the most popular book
  def the_most_pb
    popular_book = @orders.group_by{|x| x.book}.sort_by{|x,y| y.length}.last[0].title
  end

  # How many people ordered one of the three most popular books
  def how_many_pooottmpb
    @ordered_books = []
    @orders.each_index do |element|
      @ordered_books << @orders[element].book.title
    end
    @people = @ordered_books.uniq.inject({}) {|a, e| a.merge( {e => @ordered_books.count(e)} ) }
    return @people.sort_by{|key, value| value}.reverse.take(3)
  end
end
