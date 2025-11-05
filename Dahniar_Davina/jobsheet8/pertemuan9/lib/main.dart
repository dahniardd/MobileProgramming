import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'camera_page.dart';

// ====== INI DI LUAR CLASS ======
late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(MyMaterialApp(cameras: _cameras));
}

// ====== APLIKASI UTAMA ======
class MyMaterialApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyMaterialApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink,
        brightness: Brightness.light,
      ),
      home: HomePage(cameras: cameras),
    );
  }
}

// ====== HALAMAN BERANDA ======
class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const HomePage({super.key, required this.cameras});

  @override
  State<HomePage> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTakePhotoPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(camera: widget.cameras[0]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Material Design App'),
        actions: const [
          CircleAvatar(backgroundImage: AssetImage('assets/avatar.jpeg')),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gallery ", style: textTheme.titleLarge),
                FilledButton(onPressed: () {}, child: const Text('See All')),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildProfileCard('assets/avatar.jpeg'),
                buildProfileCard('assets/gambar1.jpeg'),
                buildProfileCard('assets/gambar2.jpeg'),
                buildProfileCard('assets/myprofile.jpg'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onNavItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.favorite), label: ''),
          NavigationDestination(icon: Icon(Icons.explore), label: ''),
          NavigationDestination(icon: Icon(Icons.account_circle_outlined), label: ''),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onTakePhotoPressed,
        icon: const Icon(Icons.camera_alt),
        label: const Text("Take a Photo"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildProfileCard(String imagePath, [String? name]) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
