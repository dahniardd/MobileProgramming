import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(PokeApp());
}

// ===================================================================
// APP ROOT
// ===================================================================
class PokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeAPI Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: PokemonPage(),
    );
  }
}

// ===================================================================
// POKEMON PAGE (UI + GET API)
// ===================================================================
class PokemonPage extends StatefulWidget {
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  Map<String, dynamic>? pokemonData;
  bool isLoading = false;
  String? error;

  // ---------------------------------------------------------------
  // Fetch Pokemon Data
  // ---------------------------------------------------------------
  Future<void> fetchPokemon() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto'))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        setState(() {
          pokemonData = jsonDecode(response.body);
        });
      } else {
        setState(() {
          error = 'Gagal memuat data. Status: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        error = 'Terjadi kesalahan: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Load pertama kali
  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  // ---------------------------------------------------------------
  // UI Build
  // ---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PokeAPI – Ditto')),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchPokemon,
        child: const Icon(Icons.refresh),
        tooltip: 'Refresh Data',
      ),
      body: Center(
        child: _buildPokemonCard(),
      ),
    );
  }

  // ---------------------------------------------------------------
  // CARD BUILDER
  // ---------------------------------------------------------------
  Widget _buildPokemonCard() {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    if (error != null) {
      return Text(error!, style: const TextStyle(color: Colors.red));
    }

    if (pokemonData == null) {
      return const Text('Tidak ada data.');
    }

    final name = pokemonData!['name'] ?? '-';
    final id = pokemonData!['id'] ?? '-';
    final height = pokemonData!['height'] ?? '-';
    final weight = pokemonData!['weight'] ?? '-';
    final sprite =
        pokemonData!['sprites']['front_default'] ??
        'https://via.placeholder.com/150';

    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(sprite, width: 150, height: 150),
            const SizedBox(height: 10),

            Text(
              name.toString().toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 8),

            Text('ID: $id'),
            Text('Height: $height'),
            Text('Weight: $weight'),
          ],
        ),
      ),
    );
  }
}
