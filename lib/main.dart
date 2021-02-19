import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hero Animation Flutter',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridSection(),
    );
  }
}

class GridSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResponsiveGridList(
        minSpacing: 10,
        desiredItemWidth: 150,
        children: [
          AlbumCover(
            albumTag: 'The Dark Side of th Moon',
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-7.jpg',
          ),
          AlbumCover(
            albumTag: 'The Wall',
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-10.jpg',
          ),
          AlbumCover(
            albumTag: 'The Endless River',
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/pinkfloydendlessriveralbumpochette2015.jpg',
          ),
          AlbumCover(
            albumTag: 'The Final Cut',
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-11.jpg',
          ),
          AlbumCover(
            albumTag: 'The Division Bell',
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-13.jpg',
          ),
          AlbumCover(
            albumTag: 'Animals',
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-9.jpg',
          ),
        ],
      ),
    );
  }
}

class AlbumCover extends StatelessWidget {
  final String albumUrl;
  final String albumTag;

  const AlbumCover({Key key, this.albumUrl, this.albumTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlbumPage(
                        albumTag: albumTag,
                        albumUrl: albumUrl,
                      )));
        },
        child: Hero(
          tag: albumTag,
          child: Image.network(albumUrl),
        ),
      ),
    );
  }
}

class AlbumPage extends StatelessWidget {
  final String albumUrl;
  final String albumTag;

  const AlbumPage({Key key, this.albumUrl, this.albumTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Hero(
        tag: albumTag,
        child: Image.network(albumUrl),
      ),
    );
  }
}
