import 'package:flutter/material.dart';
// WAJIB IMPORT PACKAGE PDF VIEWER YANG SUDAH DIINSTALL
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BookListScreen(),
  ));
}

class BookListScreen extends StatelessWidget {
  // Semua nama kunci diseragamkan menjadi 'pdfUrl' dan menggunakan link publik
  final List<Map<String, String>> books = [
    {
      'title': 'DBMS',
      'author': 'Tutorialspoint',
      'description':
          'Database Management System or DBMS in short refers to the technology of storing and retrieving users’ data with utmost efficiency along with appropriate secuity measures.',
      'pdfUrl': 'https://greenteapress.com/thinkpython2/thinkpython2.pdf'
    },
    {
      'title': 'Flutter',
      'author': 'Tutorialspoint',
      'description':
          'Flutter is an open source framework to create high quality, high performance mobile applications across mobile operating systems - Android and iOS.',
      'pdfUrl': 'https://greenteapress.com/thinkjava7/thinkjava.pdf'
    },
    {
      'title': 'Dart Programming',
      'author': 'Tutorialspoint',
      'description':
          'Dart is an open-source general-purpose programming language. It is originally developed Google and later approved as a standard by ECMA.',
      'pdfUrl': 'https://eloquentjavascript.net/Eloquent_JavaScript.pdf'
    },
    {
      'title': 'Computer Fundamentals',
      'author': 'Tutorialspoint',
      'description':
          'Computer is an advanced electronic device that takes raw data as an input from the user and processes it under the control of a set of instructions.',
      'pdfUrl': 'https://greenteapress.com/thinkos/thinkos.pdf'
    },
    {
      'title': 'Data Structures',
      'author': 'Tutorialspoint',
      'description':
          'Data Structures are the programmatic way of storing data so that data can be used efficiently.',
      'pdfUrl': 'https://greenteapress.com/thinkstats2/thinkstats2.pdf'
    },
    {
      'title': 'Think Python',
      'author': 'Allen B. Downey',
      'description':
          'Buku pengantar pemrograman Python yang sangat populer dan mudah dipahami oleh pemula.',
      'pdfUrl': 'https://greenteapress.com/thinkpython2/thinkpython2.pdf'
    },
    {
      'title': 'Eloquent JavaScript',
      'author': 'Marijn Haverbeke',
      'description':
          'Buku modern yang sangat komprehensif untuk mendalami bahasa pemrograman JavaScript.',
      'pdfUrl': 'https://eloquentjavascript.net/Eloquent_JavaScript.pdf'
    },
    {
      'title': 'Think OS',
      'author': 'Allen B. Downey',
      'description':
          'Pengantar singkat tentang bagaimana Sistem Operasi bekerja di balik layar.',
      'pdfUrl': 'https://greenteapress.com/thinkos/thinkos.pdf'
    },
    {
      'title': 'Bitcoin Whitepaper',
      'author': 'Satoshi Nakamoto',
      'description':
          'Makalah asli yang menjadi cikal bakal teknologi Cryptocurrency dan Blockchain.',
      'pdfUrl': 'https://bitcoin.org/bitcoin.pdf'
    },
    {
      'title': 'GNU Bash Reference',
      'author': 'Chet Ramey',
      'description':
          'Panduan detail mengenai fitur dan perintah dasar pada terminal Bash.',
      'pdfUrl': 'https://www.gnu.org/software/bash/manual/bash.pdf'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book List')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]['title']!),
            subtitle: Text(books[index]['author']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                    title: books[index]['title']!,
                    author: books[index]['author']!,
                    description: books[index]['description']!,
                    pdfUrl: books[index]['pdfUrl']!, // SUDAH DIPERBAIKI DISINI
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String pdfUrl;

  BookDetailScreen(
      {required this.title,
      required this.author,
      required this.description,
      required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: $title',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Author: $author',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            SizedBox(height: 12),
            Text('Description:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadingBookFile(pdfUrl: pdfUrl),
                      ),
                    );
                  },
                  child: Text('Read the book'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ReadingBookFile extends StatelessWidget {
  final String pdfUrl;

  ReadingBookFile({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading Book'),
      ),
      body: SfPdfViewer.network(pdfUrl),
    );
  }
}
