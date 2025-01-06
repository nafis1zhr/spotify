import 'package:flutter/material.dart';

class LyricsScreen extends StatelessWidget {
  const LyricsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_lyrics.png'), // Ganti dengan path gambar Anda
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Bad Guy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "(Verse 1)",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                _buildLyrics(),
                const Spacer(),
                _buildMusicControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        "Lyrics",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  Widget _buildLyrics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Sleepin', you're on your tippy toes\nCreepin' around like no one knows",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16),
        Text(
          "Think you're so criminal\nBruises on both my knees for you",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16),
        Text(
          "Don't say thank you or please\nI do what I want when I'm wanting to",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildMusicControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/img_artist.png'), // Ganti dengan path gambar Anda
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bad Guy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Billie Eilish",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("2:25"),
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: () {},
              ),
              FloatingActionButton(
                child: const Icon(Icons.pause),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: () {},
              ),
              const Text("4:02"),
            ],
          ),
        ],
      ),
    );
  }
}
