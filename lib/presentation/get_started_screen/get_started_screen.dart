import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    
    // Menghitung nilai responsif
    final double verticalSpacing = screenHeight * 0.02; // 2% dari tinggi layar
    final double horizontalPadding = screenWidth * 0.08; // 8% dari lebar layar
    final bool isSmallScreen = screenHeight < 700; // Breakpoint untuk layar kecil

    return Scaffold(
      body: Stack(
        children: [
          // Background Image dengan filter gelap
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bule.jpg'), // Ganti dengan path gambar latar
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), // Menambahkan filter gelap
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Konten di atas background
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur posisi konten
                children: [
                  Spacer(flex: 2), // Memberi ruang ke atas

                  // Logo Spotify yang lebih besar
                  SizedBox(
                    height: screenHeight * 0.1, // 10% dari tinggi layar
                    child: Image.asset(
                      'assets/images/spotify_logo.png', // Ganti dengan path logo
                      fit: BoxFit.contain,
                    ),
                  ),
                  
                  Spacer(flex: 2), // Menambah jarak antara logo dan teks

                  // Title
                  Text(
                    'Enjoy listening to music',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 20 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: verticalSpacing),

                  // Deskripsi
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: isSmallScreen ? 12 : 14,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  Spacer(flex: 3), // Menambah ruang antara teks dan tombol

                  // Tombol Get Started
                  SizedBox(
                    height: screenHeight * 0.08, // 8% dari tinggi layar, untuk tombol yang lebih besar
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika navigasi di sini
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1DB954),
                        shape: StadiumBorder(), // Membuat tombol berbentuk oval
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25), // Memberikan lebar yang proporsional
                      ),
                      child: Text(
                        'Get started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 14 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: verticalSpacing * 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
