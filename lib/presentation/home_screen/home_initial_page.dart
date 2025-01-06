import 'package:flutter/material.dart'; // Pastikan untuk mengimpor MusicScreen
import 'package:spotify/presentation/music_srceen/music_srceen.dart';
import 'package:spotify/presentation/home_screen/home_initial_page.dart';

// Definisi class SongSearchDelegate untuk pencarian lagu
class SongSearchDelegate extends SearchDelegate<String> {
  final List<String> songs = [
    'Bad Guy - Billie Eilish',
    'Happier Than Ever - Billie Eilish',
    'Blinding Lights - The Weeknd',
    'Levitating - Dua Lipa',
    'Shape of You - Ed Sheeran',
    'Savage Love - Jawsh 685, Jason Derulo',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Reset query pencarian
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Menutup pencarian
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = songs
        .where((song) => song.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context,
                results[index]); // Menutup dan mengirim hasil pencarian
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = songs
        .where((song) => song.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context); // Menampilkan hasil pencarian
          },
        );
      },
    );
  }
}

class HomeInitialPage extends StatefulWidget {
  final Function(String) onFavoriteAdded; // Parameter untuk menambah lagu favorit

  const HomeInitialPage({Key? key, required this.onFavoriteAdded}) : super(key: key);
  @override
  _HomeInitialPageState createState() => _HomeInitialPageState();
}

class _HomeInitialPageState extends State<HomeInitialPage> {
  int selectedIndex =
      -1; // Menyimpan indeks item yang aktif, -1 berarti tidak ada yang aktif
  List<bool> isFavorite = List.generate(
      5, (index) => false); // Menyimpan status favorite untuk tiap playlist

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // Membuat konten bisa digulir
          child: Column(
            children: [
              _buildHeader(),
              _buildNavTabs(),
              _buildNewAlbumSection(),
              _buildPopularSection(),
              _buildPlaylistSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Header bagian atas (Search, Logo, Notifications)
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Grup sisi kiri
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Implementasi pencarian
                  showSearch(
                    context: context,
                    delegate: SongSearchDelegate(),
                  );
                },
              ),
              const SizedBox(width: 8),
              Image.asset(
                'assets/images/spotify_logo.png',
                height: 24,
              ),
            ],
          ),
          // Sisi kanan
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // Menampilkan tab navigasi seperti News, Video, Artist, Podcast
  Widget _buildNavTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildTab("News", isSelected: true),
          _buildTab("Video"),
          _buildTab("Artists"),
          _buildTab("Podcast"),
        ],
      ),
    );
  }

  // Membuat tampilan tab
  Widget _buildTab(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Menampilkan bagian album terbaru
  Widget _buildNewAlbumSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "New album",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/bule.jpg',
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Happier Than Ever",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Billie Eilish",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Menampilkan bagian populer
  Widget _buildPopularSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Popular",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Implementasikan aksi untuk "See More"
                },
                child: const Text("See More"),
              ),
            ],
          ),
          // Menggunakan ListView dengan shrinkWrap: true untuk mencegah masalah layout
          Container(
            height: 200, // Tentukan tinggi tetap untuk ListView
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap:
                  true, // Mengatur agar ListView menggunakan ruang yang cukup
              children: [
                _buildPopularItem(
                  image: "assets/images/bule.jpg",
                  title: "Bad Guy",
                  artist: "Billie Eilish",
                  index: 0,
                ),
                _buildPopularItem(
                  image: "assets/images/bule.jpg",
                  title: "Scorpion",
                  artist: "Drake",
                  index: 1,
                ),
                _buildPopularItem(
                  image: "assets/images/bule.jpg",
                  title: "Scorpion",
                  artist: "Drake",
                  index: 2,
                ),
                _buildPopularItem(
                  image: "assets/images/bule.jpg",
                  title: "Scorpion",
                  artist: "Drake",
                  index: 3,
                ),
                _buildPopularItem(
                  image: "assets/images/bule.jpg",
                  title: "Scorpion",
                  artist: "Drake",
                  index: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Membuat item populer di bagian popular
  Widget _buildPopularItem({
    required String image,
    required String title,
    required String artist,
    required int index,
  }) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          // Navigasi ke MusicScreen dan kirimkan data lagu
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MusicScreen(
                title: title,
                artist: artist,
                image: image,
              ),
            ),
          );
          
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                // Menambahkan ikon pause di pojok kanan atas jika musik sedang diputar
                if (selectedIndex == index)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: const Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              artist,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Menampilkan bagian playlist
  Widget _buildPlaylistSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Playlist",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("see more"),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5, // Misalnya ada 5 item di daftar playlist
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Update status isPlaying ketika gambar ditekan
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      Icons.music_note,
                      color: selectedIndex == index
                          ? Colors.green
                          : Colors
                              .grey, // Hanya item yang dipilih yang berubah warna
                    ),
                  ),
                ),
                title: Text(
                  "My Playlist #${index + 1}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("12 songs"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite[index]
                            ? Colors.red
                            : Colors.grey, // Merah jika dipilih
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite[index] = !isFavorite[index];
                          print(
                              "isFavorite[$index]: ${isFavorite[index]}"); // Cek status favorit
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.history),
                      onPressed: () {},
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  
}
