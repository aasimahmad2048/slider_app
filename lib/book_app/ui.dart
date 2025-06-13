import 'package:flutter/material.dart';
import 'book.dart';
import 'db_helper.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book CRUD',
    
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BookHome(),
    );
  }
}

class BookHome extends StatefulWidget {
  const BookHome({super.key});

  @override
  State<BookHome> createState() => _BookHomeState();
}

class _BookHomeState extends State<BookHome> {
  
  final DBHelper _dbHelper = DBHelper();
  List<Book> _books = [];

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();

  int? _editingId;

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    final books = await _dbHelper.getBooks();
    setState(() {
      _books = books;
    });
  }

  Future<void> _saveBook() async {
    final title = _titleController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;

    if (_editingId == null) {
      await _dbHelper.insertBook(Book(title: title, price: price));
    } else {
      await _dbHelper.updateBook(
        Book(id: _editingId, title: title, price: price),
      );
    }

    _titleController.clear();
    _priceController.clear();
    _editingId = null;
    _loadBooks();
  }

  void _editBook(Book book) {
    _titleController.text = book.title;
    _priceController.text = book.price.toString();
    _editingId = book.id;
  }

  Future<void> _deleteBook(int id) async {
    await _dbHelper.deleteBook(id);
    _loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book CRUD')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Book Title'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveBook,
              child: Text(_editingId == null ? 'Add Book' : 'Update Book'),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _books.length,
                itemBuilder: (ctx, i) {
                  final book = _books[i];
                  return ListTile(
                    title: Text(book.title),
                    subtitle: Text('₹${book.price.toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _editBook(book),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteBook(book.id!),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
