import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';  // Mengimpor pustaka just_audio

class MusicScreen extends StatefulWidget {
  final String title;
  final String artist;
  final String image;

  const MusicScreen({
    Key? key,
    required this.title,
    required this.artist,
    required this.image,
  }) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  int _currentSongIndex = 0;

  final List<Map<String, String>> songs = [
    {
      'title': 'Song 1',
      'artist': 'Artist 1',
      'image': 'assets/images/song1.jpg',
      'audio': 'assets/audio/song1.mp3',
    },
    {
      'title': 'Song 2',
      'artist': 'Artist 2',
      'image': 'assets/images/song2.jpg',
      'audio': 'assets/audio/song2.mp3',
    },
    {
      'title': 'Song 3',
      'artist': 'Artist 3',
      'image': 'assets/images/song3.jpg',
      'audio': 'assets/audio/song3.mp3',
    },
  ];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.setAsset(songs[_currentSongIndex]['audio']!);
      await _audioPlayer.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _selectSong(int index) async {
    setState(() {
      _currentSongIndex = index;
      _isPlaying = false;
    });

    await _audioPlayer.setAsset(songs[_currentSongIndex]['audio']!);
    await _audioPlayer.play();
    setState(() {
      _isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(widget.title),
            subtitle: Text(widget.artist),
          ),
          FloatingActionButton(
            child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: _togglePlayPause,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(songs[index]['image']!),
                  ),
                  title: Text(songs[index]['title']!),
                  subtitle: Text(songs[index]['artist']!),
                  onTap: () => _selectSong(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
