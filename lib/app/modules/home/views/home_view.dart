import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ujastore/app/utils/responsive_layout.dart';
import '../controllers/home_controller.dart';
import '../controllers/profile_controller.dart';
import 'home_content.dart'; // Pastikan ini sesuai dengan kode Anda
import 'all_games_page.dart';
import 'profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
  final ProfileController profileController = Get.put(ProfileController());

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _mobilePages = <Widget>[
    const HomeContent(), // Pastikan HomeContent menampilkan produk dengan benar
     AllGamesPage(),
    ProfilePage(),
  ];

  static final List<Widget> _tabletPages = <Widget>[
    const HomeContent(), // Bisa menyesuaikan lebih besar untuk tablet
    AllGamesPage(),
     ProfilePage(), // ProfilePage untuk tablet bisa lebih kompleks
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 30, 43, 1),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('ujastore.id', style: TextStyle(color: Colors.white)),
            GestureDetector(
              onTap: () {
                Get.to(() =>  ProfilePage()); // Navigasi ke halaman profile
              },
              child: Obx(() => CircleAvatar(
                    backgroundImage: profileController.profileImage != null
                        ? FileImage(profileController.profileImage!)
                        : null,
                    radius: 20,
                    child: profileController.profileImage == null
                        ? const Icon(Icons.person,
                            size: 30, color: Colors.grey) // Placeholder
                        : null, // Ukuran avatar
                  )),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 27, 56, 78),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(13, 30, 43, 1),
              ),
              child: Column(
                children: [
                  Obx(() => CircleAvatar(
                        radius: 40, // Ukuran lingkaran foto profil
                        backgroundImage: profileController.profileImage != null
                            ? FileImage(profileController.profileImage!)
                            : null,
                        backgroundColor: Colors.grey,
                        child: profileController.profileImage == null
                            ? const Icon(Icons.person,
                                size: 40, color: Colors.grey) // Placeholder
                            : null,
                      )),
                  const SizedBox(height: 8),
                  Obx(() => Text(
                        profileController
                            .userName.value, // Menampilkan nama pengguna
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0; // Pindah ke halaman Beranda
                });
                Navigator.pop(context); // Tutup drawer setelah memilih
              },
            ),
            ListTile(
              leading: const Icon(Icons.games),
              title: const Text('Semua Game'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1; // Pindah ke halaman Semua Game
                });
                Navigator.pop(context); // Tutup drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.track_changes),
              title: const Text('Lacak Pesanan'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer setelah memilih
              },
            ),
          ],
        ),
      ),
      body: ResponsiveLayout(
        mobileLayout: _buildMobileLayout(),
        tabletLayout: _buildTabletLayout(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari Game',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  // Layout khusus mobile
  Widget _buildMobileLayout() {
    return _mobilePages[_selectedIndex];
  }

  // Layout khusus tablet
  Widget _buildTabletLayout() {
    return _tabletPages[_selectedIndex];
  }
}
