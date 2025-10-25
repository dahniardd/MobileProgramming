import 'package:app/contact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactState(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
