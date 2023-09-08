/* 

Soal : 

Sebuah toko buku ingin mengembangkan sebuah sistem untuk mengelola data buku. Data buku tersebut terdiri dari ID, judul, penerbit, harga dan kategori. Sistem tersebut dapat menambahkan, mendapatkan semua data buku dan menghapus data buku. Buatlah program berdasarkan skenario tersebut.

 */
class Book {
  int id;
  String title;
  String publisher;
  double price;
  String category;

  Book(this.id, this.title, this.publisher, this.price, this.category);
}

class Bookstore {
  List<Book> books = [];
  int nextBookId = 1;

  // Menambahkan buku ke sistem
  void addBook(String title, String publisher, double price, String category) {
    Book newBook = Book(nextBookId, title, publisher, price, category);
    books.add(newBook);
    nextBookId++;
  }

  // Mendapatkan semua data buku
  List<Book> getAllBooks() {
    return books;
  }

  // Menghapus buku berdasarkan ID
  void removeBook(int bookId) {
    books.removeWhere((book) => book.id == bookId);
  }
}

void main() {
  var bookstore = Bookstore();

  // Menambahkan beberapa buku ke sistem
  bookstore.addBook("Book 1", "Publisher A", 25.0, "Fiction");
  bookstore.addBook("Book 2", "Publisher B", 30.0, "Non-fiction");
  bookstore.addBook("Book 3", "Publisher A", 20.0, "Mystery");

  // Mendapatkan semua data buku
  var allBooks = bookstore.getAllBooks();
  print("Daftar Buku:");
  for (var book in allBooks) {
    print(
        "ID: ${book.id}, Judul: ${book.title}, Penerbit: ${book.publisher}, Harga: ${book.price}, Kategori: ${book.category}");
  }

  // Menghapus buku berdasarkan ID
  bookstore.removeBook(2);

  // Mendapatkan semua data buku setelah penghapusan
  var updatedBooks = bookstore.getAllBooks();
  print("\nDaftar Buku Setelah Penghapusan:");
  for (var book in updatedBooks) {
    print(
        "ID: ${book.id}, Judul: ${book.title}, Penerbit: ${book.publisher}, Harga: ${book.price}, Kategori: ${book.category}");
  }
}
