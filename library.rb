require_relative './book.rb'
require_relative './author.rb'
require_relative './order.rb'
require_relative './reader.rb'

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
    people = @orders.group_by{|x| x.book}.sort_by{|x,y| -y.length}.to_h.values.flatten.uniq { |order| order.reader }.size
  end
end
