require './author'
require './book'
require './library'
require './order'
require './reader'

def db
  #authors
  author1 = Author.new("Hermann Hesse", "he was a German-Swiss poet, novelist, and painter.")
  author2 = Author.new("Dalai Lama XIV", "is a practicing member of the Gelug School of Tibetan Buddhism")
  author3 = Author.new("Alan W. Watts", "was a British philosopher, writer and speaker, who...")
  author4 = Author.new("Charlotte Joko Beck", "was an American Zen teacher...")

  #books
  book1 = Book.new("Siddhartha", author1)
  book2 = Book.new("The Art of Happiness", author2)
  book3 = Book.new("The Way of Zen", author3)
  book4 = Book.new("Everyday Zen: Love and Work", author4)

  #readers
  reader1 = Reader.new("Ivan Ivanov", "i.ivanov@gmail.com", "New York", "5th Avenue", "12-21")
  reader2 = Reader.new("Pete Petrov", "p.petrov@gmail.com", "Kyiv", "Khmelnitsky St.", "30-51")
  reader3 = Reader.new("Stan Sidorenko", "s.sidorenko@gmail.com", "Dnipro", "Naberezhnaya St.", "100-41")
  reader4 = Reader.new("Andrey Andrienko", "a.andrienko@gmail.com", "Dnipro", "Pravda Blv.", "234-11")

  #orders
  order1 = Order.new(book2, reader4, "01.04.2016")
  order2 = Order.new(book2, reader2, "04.04.2016")
  order3 = Order.new(book2, reader1, "11.04.2016")
  order4 = Order.new(book2, reader4, "13.04.2016")
  order5 = Order.new(book2, reader1, "13.05.2016")
  order6 = Order.new(book4, reader4, "14.05.2016")
  order7 = Order.new(book4, reader2, "24.05.2016")
  order8 = Order.new(book2, reader3, "25.05.2016")
  order9 = Order.new(book1, reader3, "27.05.2016")
  order10 = Order.new(book3, reader4, "28.05.2016")
  order11 = Order.new(book4, reader2, "29.05.2016")
  order12 = Order.new(book1, reader4, "01.06.2016")
  order13 = Order.new(book3, reader1, "10.06.2016")
  order14 = Order.new(book3, reader3, "21.06.2016")
  order15 = Order.new(book3, reader4, "28.06.2016")

  library = Library.new([book1, book2, book3, book4],
                        [order1, order2, order3, order4, order5,
                         order6, order7, order8, order9, order10,
                         order11, order12, order13, order14, order15],
                        [reader1, reader2, reader3, reader4],
                        [author1, author2, author3, author4])
end
