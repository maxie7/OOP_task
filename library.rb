require_relative './structure.rb'

class Library < Struct.new(:books, :orders, :readers, :authors)

  include Enumerable

  # Reading and converting info from data files
  @books = File.readlines("data/books")
  @books.each_index { |x| @books[x] = Book.new(@books[x], @books[x+1]) if x % 2 == 0 }
  @books.delete_if { |e| e.is_a?(String) }

  @authors = Array.new
  @auth = File.readlines("data/authors")
  @auth.each { |line|
    words = line.split(';')
    a = Author.new
    a.name = words[0].strip
    a.biography = words[1].strip
    @authors.push(a)
  }

  @readers = Array.new
  @read = File.readlines("data/readers")
  @read.each { |line|
    words = line.split(',')
    r = Reader.new
    r.name = words[0].strip
    r.email = words[1].strip
    r.city = words[2].strip
    r.street = words[3].strip
    r.house = words[4].strip
    @readers.push(r)
  }

  @@orders = Array.new
  @ord = File.readlines("data/orders")
  @ord.each { |line|
    words = line.split(',')
    o = Order.new
    o.book = words[0].strip
    o.reader = words[1].strip
    o.date = words[2].strip
    @@orders.push(o)
  }

  # who often takes the book
  def who_ottb
    @_orders = @@orders.group_by {|x| x.reader }
    @often_reader = @_orders.keys.take(1)
    puts @often_reader
  end
  # the most popular book
  def the_most_pb
    @_orders = @@orders.group_by {|x| x.book }
    @popular_book = @_orders.keys.take(1)
    puts @popular_book
  end

  # How many people ordered one of the three most popular books
  def how_many_pooottmpb
    @order_books = []
    @count_people = @@orders.each_index do |element|
      @order_books << @@orders[element].book
    end
    @people = @order_books.uniq.inject({}) { |a, e| a.merge( {e => @order_books.count(e)} ) }
    puts @people.sort_by{|key, value| value}.reverse.take(3)
  end

end
