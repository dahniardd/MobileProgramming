import 'package:flutter/material.dart';

void main() {
  runApp(const Sib3aApp());
}

class Sib3aApp extends StatelessWidget {
  const Sib3aApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dahniar Davina Sib3a - Flutter Scaffold & AppBar',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Belajar Scaffold & AppBar"),
          backgroundColor: Colors.pink,
          actions: const [
            Icon(Icons.search), // ikon di kanan
            Icon(Icons.settings),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 230, 97, 141)),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(leading: Icon(Icons.message), title: Text('Messages')),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // digunakan untuk mengatur posisi vertikal
            children: [
              const Text("Hello World!"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Icon(Icons.star, color: Colors.amber, size: 40),
                  Icon(Icons.star, color: Colors.amber, size: 40),
                  Icon(Icons.star, color: Colors.amber, size: 40),
                  Icon(Icons.star, color: Colors.amber, size: 40),
                  Icon(Icons.star, color: Colors.amber, size: 40),
                ],
              ),
              // Tambahkan Container disini
              /* Container( // tidak bisa dijadikan const karena ada properti yang nilainya berubah-ubah
                width: 200,
                height: 100,
                color: Colors.amber,
                child: const Center(
                  child: Text("Dasar Widget Container"),
                ),
              ), */
              /* Container(
                margin: const EdgeInsets.all(20), // jarak dari widget lain
                padding: const EdgeInsets.all(10), // jarak dari border
                color: Colors.amber,
                child: const Text("Dasar Widget Container dengan Margin dan Padding", style: TextStyle(color: Colors.white)),
              ), */
              /* Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 3),
                )
              ), */
              Container(
                width: 400,
                height: 250,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 220, 44, 102), Color.fromARGB(255, 255, 128, 171)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)), // border radius 20
               ),
                child: const Center(
                  child: Text("Saya Sedang Belajar Dasar Widget Gradient Container", style: TextStyle(color: Colors.white)),
                ),
              ),
              const Text("Saya Sedang Belajar Dasar Widget Pada Flutter"),

              // Elevated Button, tombol dengan evek timbul, biasanya digunakan untuk aksi utama
              ElevatedButton( 
                onPressed: () { 
                  print("Elevated Button pressed!"); 
                },
                child: const Text("Elevated Button"),
              ),

              // Text Button, tombol tanpa efek timbul sederhana tanpa latar, biasanya digunakan untuk aksi sekunder
              TextButton( 
                onPressed: () { 
                  print("Text Button pressed!"); 
                },
                child: const Text("Text Button"),
              ),

              // Outlined Button, tombol dengan garis tepi tanpa background
              OutlinedButton( 
                onPressed: () { 
                  print("Outlined Button pressed!"); 
                },
                child: const Text("Outlined Button"),
              ),

              // Icon Button, tombol yang berbentuk ikon, biasanya digunakan untuk aksi cepat
              IconButton( 
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () { 
                  print("Icon Button pressed!"); 
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}