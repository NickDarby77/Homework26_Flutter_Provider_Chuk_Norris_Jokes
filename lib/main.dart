import 'package:flutter/material.dart';
import 'package:lesson52_practice_provider_chuknorris/providers/joke_provider.dart';
import 'package:lesson52_practice_provider_chuknorris/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JokeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const HomePage(),
      ),
    );
  }
}
