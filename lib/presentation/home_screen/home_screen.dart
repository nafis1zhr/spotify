import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:spotify/presentation/artics_page/artics_page.dart';
import 'package:spotify/presentation/register_screen/register_screen.dart';
import 'package:spotify/presentation/library_page/library_page.dart';
import 'package:spotify/presentation/home_screen/home_initial_page.dart'; // Tambahkan import untuk LibraryPage

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Daftar lagu favorit
  List<String> favoriteSongs = [];

  // Fungsi untuk menampilkan halaman yang sesuai dengan rute
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeInitialPage:
        return HomeInitialPage(
          onFavoriteAdded: (song) {
            setState(() {
              if (!favoriteSongs.contains(song)) {
                favoriteSongs.add(song);
              }
            });
          },
        );
      case AppRoutes.articsPage:
        return const ArticsPage();
      case AppRoutes.libraryPage:
        return LibraryPage(favoriteSongs: favoriteSongs); // Pastikan favoriteSongs diteruskan ke LibraryPage
      default:
        return HomeInitialPage(
          onFavoriteAdded: (song) {
            setState(() {
              if (!favoriteSongs.contains(song)) {
                favoriteSongs.add(song);
              }
            });
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          backgroundColor: Colors.green,
        ),
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homeInitialPage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: const Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(icon: Icons.home, label: "Home", isSelected: true),
          _buildNavItem(icon: Icons.search, label: "Search"),
          _buildNavItem(icon: Icons.history, label: "Library", onTap: () {
            // Navigasi ke LibraryPage
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LibraryPage(favoriteSongs: favoriteSongs),
              ),
            );
          }), // Navigasi ke Library
          _buildNavItem(icon: Icons.person_outline, label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    bool isSelected = false,
    VoidCallback? onTap, // Tambahkan parameter onTap
  }) {
    return GestureDetector(
      onTap: onTap ?? () {
        // Tindakan default jika onTap tidak diberikan
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.green : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
