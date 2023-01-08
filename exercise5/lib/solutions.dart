import 'package:exercise_e5/infrastructure/book.dart';
import 'infrastructure/book_repository.dart';


// Part 1

// Part 1, step 1.
Future<void> longOperation() async {
  return Future.delayed(Duration(seconds: 3));
}

// Part 1, step 2.
Future<void> sleepMilliseconds(int milliseconds) async {
  return await Future.delayed(Duration(milliseconds: milliseconds));
}

// Part 1, step 3.
Future<int> readTemperature() async {
  return await Future.delayed(Duration(milliseconds: 200), () => 23);
}

// Part 2

class BookService {
  static BookService? _instance;

  BookService._();

  // Part 2, step 1.
  static getInstance() {
    if (_instance == null) {
      _instance = BookService._();
    }
    return _instance!;
  }

  // Part 2, step 2.
  Stream<Book> getBooks() {
    return BookRepository.getInstance().fetchAllBooks();
  }

  // Part 2, step 3.
  Stream<String> getAllTitles() {
    return getBooks().map((book) => book.title);
  }

  // Part 2, step 4.
  Stream<Book> searchByTitle(String searchString) {
    return getBooks().where((book) => book.title.contains(searchString));
  }

  // Part 2, step 5.
  void countBooks(void Function(int) callback) {
    _countBooks()
        .then((success) => callback(success));
  }

  Future<int> _countBooks() async {
    return await getBooks().length;
  }
}
