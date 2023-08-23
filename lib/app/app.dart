import 'package:flutter/material.dart';
import 'package:sylvinho/presentation/page/home_page.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sylvinho",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
      },
    );
  }
}
