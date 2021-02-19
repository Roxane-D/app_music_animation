import 'package:app_music_animation/album-page.dart';
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
      home: TabsPage(),
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

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        title: new Text(
          'Search library',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: Center(
        child: GridSection(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            title: Text('Library'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio),
            title: Text('Radio'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.deepPurple[700],
        onTap: _onItemTapped,
      ),
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
          SizedBox(height: 10),
          SizedBox(height: 10),
          AlbumCover(
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-7.jpg',
            albumName: 'The Dark Side of th Moon',
            albumArtist: 'Pink Floyd',
          ),
          AlbumCover(
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-10.jpg',
            albumName: 'The Wall',
            albumArtist: 'Pink Floyd',
          ),
          AlbumCover(
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/pinkfloydendlessriveralbumpochette2015.jpg',
            albumName: 'The Endless River',
            albumArtist: 'Pink Floyd',
          ),
          AlbumCover(
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-11.jpg',
            albumName: 'The Final Cut',
            albumArtist: 'Pink Floyd',
          ),
          AlbumCover(
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-13.jpg',
            albumName: 'The Division Bell',
            albumArtist: 'Pink Floyd',
          ),
          AlbumCover(
            albumUrl:
                'https://www.wikilinks.fr/wp-content/uploads/2012/01/cover-pink-floyd-9.jpg',
            albumName: 'Animals',
            albumArtist: 'Pink Floyd',
          ),
          SizedBox(height: 10),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class AlbumCover extends StatelessWidget {
  final String albumUrl;
  final String albumName;
  final String albumArtist;

  const AlbumCover({Key key, this.albumUrl, this.albumName, this.albumArtist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
            color: Colors.black.withOpacity(0.3),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumPage(
                    albumUrl: albumUrl,
                    albumTag: albumName,
                    albumName: albumName,
                    albumArtist: albumArtist,
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: albumName,
                  child: Image.network(albumUrl),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        albumName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        albumArtist,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
