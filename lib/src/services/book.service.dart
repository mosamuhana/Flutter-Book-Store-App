import '../models.dart';

class BookService {
  static BookService _instance;

  static BookService get instance => _instance ?? BookService._();

  final _books = _getAllBooks();

  BookService._();

  Future<List<Book>> getAll() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _books;
  }

  Future<Book> getOne(int id) async {
    await Future.delayed(Duration(milliseconds: 500));

    final book = _books.firstWhere((x) => x.id == id, orElse: () => null);
    if (book == null) {
      throw Exception('Book not found');
    }
    return book;
  }
}

List<Book> _getAllBooks() {
  String _lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id neque libero. Donec finibus sem viverra, luctus nisi ac, semper enim. Vestibulum in mi feugiat, mattis erat suscipit, fermentum quam. Mauris non urna sed odio congue rhoncus. \nAliquam a dignissim ex. Suspendisse et sem porta, consequat dui et, placerat tortor. Sed elementum nunc a blandit euismod. Cras condimentum faucibus dolor. Etiam interdum egestas sagittis. Aliquam vitae molestie eros. Cras porta felis ac eros pellentesque, sed lobortis mi eleifend. Praesent ut.';

  return [
    Book(
      id: 1,
      title: 'CorelDraw untuk Tingkat Pemula Sampai Mahir',
      writer: 'Jubilee Enterprise',
      price: 19.99,
      image: 'assets/images/corel.jpg',
      rating: 3.5,
      pages: 123,
      description: _lorem,
    ),
    Book(
      id: 2,
      title: 'Buku Pintar Drafter Untuk Pemula Hingga Mahir',
      writer: 'Widada',
      price: 29.99,
      image: 'assets/images/drafter.jpg',
      rating: 4.5,
      pages: 200,
      description: _lorem,
    ),
    Book(
      id: 3,
      title: 'Adobe InDesign: Seri Panduan Terlengkap',
      writer: 'Jubilee Enterprise',
      price: 18,
      image: 'assets/images/indesign.jpg',
      rating: 5.0,
      pages: 324,
      description: _lorem,
    ),
    Book(
      id: 4,
      title: 'Pemodelan Objek Dengan 3Ds Max 2014',
      writer: 'Wahana Komputer',
      price: 23,
      image: 'assets/images/max_3d.jpeg',
      rating: 3.0,
      pages: 200,
      description: _lorem,
    ),
    Book(
      id: 5,
      title: 'Penerapan Visualisasi 3D Dengan Autodesk Maya',
      writer: 'Dhani Ariatmanto',
      price: 26,
      image: 'assets/images/maya.jpeg',
      rating: 4.8,
      pages: 234,
      description: _lorem,
    ),
    Book(
      id: 6,
      title: 'Teknik Lancar Menggunakan Adobe Photoshop',
      writer: 'Jubilee Enterprise',
      price: 19,
      image: 'assets/images/photoshop.jpg',
      rating: 4.5,
      pages: 240,
      description: _lorem,
    ),
    Book(
      id: 7,
      title: 'Adobe Premiere Terlengkap dan Termudah',
      writer: 'Jubilee Enterprise',
      price: 27,
      image: 'assets/images/premier.jpg',
      rating: 4.8,
      pages: 432,
      description: _lorem,
    ),
    Book(
      id: 8,
      title: 'Cad Series : Google Sketchup Untuk Desain 3D',
      writer: 'Wahana Komputer',
      price: 33,
      image: 'assets/images/sketchup.jpeg',
      rating: 4.5,
      pages: 321,
      description: _lorem,
    ),
    Book(
      id: 9,
      title: 'Webmaster Series : Trik Cepat Menguasai CSS',
      writer: 'Wahana Komputer',
      price: 24.99,
      image: 'assets/images/webmaster.jpeg',
      rating: 3.5,
      pages: 431,
      description: _lorem,
    ),
  ];
}
