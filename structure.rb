class Book < Struct.new(:title, :author)

end

class Order < Struct.new(:book, :reader, :date)

end

class Reader < Struct.new(:name, :email, :city, :street, :house)

end

class Author < Struct.new(:name, :biography)

end
