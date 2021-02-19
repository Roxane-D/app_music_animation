import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  final String albumUrl;
  final String albumTag;
  final String albumName;
  final String albumArtist;
  const AlbumPage(
      {Key key, this.albumUrl, this.albumTag, this.albumName, this.albumArtist})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: new AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black.withOpacity(0.4),
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: albumTag,
              child: Container(
                width: double.infinity,
                height: 400.0,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        albumUrl,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(70, 30, 20, 30),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              color: Colors.deepPurple[700],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        albumName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        albumArtist,
                        style: TextStyle(color: Colors.white60, fontSize: 17),
                      ),
                    ],
                  ),
                  playButton,
                ],
              ),
            ),
            songsList,
          ],
        ),
      ),
    );
  }
}

Widget playButton = Container(
  padding: EdgeInsets.all(5),
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        spreadRadius: 1,
        blurRadius: 3,
        offset: Offset(0, 2),
        color: Colors.black.withOpacity(0.3),
      )
    ],
  ),
  child: IconButton(
      icon: Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: 25,
      ),
      onPressed: null),
);

Widget songsList = Column(
  children: [
    SongLine(songDuration: '0:37', songName: 'First', songNb: '1'),
    SongLine(songDuration: '2:10', songName: 'Second', songNb: '2'),
    SongLine(songDuration: '2:77', songName: 'Third', songNb: '3'),
    SongLine(songDuration: '4:54', songName: 'Fourth', songNb: '4'),
    SongLine(songDuration: '3:39', songName: 'Fifth', songNb: '5'),
    SongLine(songDuration: '2:23', songName: 'Sixth', songNb: '6'),
  ],
);

class SongLine extends StatelessWidget {
  final String songNb;
  final String songName;
  final String songDuration;
  const SongLine({Key key, this.songNb, this.songName, this.songDuration})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 17, 20, 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: Icon(Icons.volume_up, color: Colors.grey, size: 25),
          ),
          Expanded(
            child: Row(
              children: [
                Text(songNb,
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
                SizedBox(width: 30),
                Text(songName, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Text(songDuration, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
