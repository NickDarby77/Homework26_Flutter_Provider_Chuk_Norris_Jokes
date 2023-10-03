import 'package:flutter/material.dart';
import 'package:lesson52_practice_provider_chuknorris/hive/hive_joke_model.dart';
import 'package:lesson52_practice_provider_chuknorris/hive/hive_service.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<HiveJokeModel> listJokes = <HiveJokeModel>[];

  @override
  void initState() {
    listJokes = HiveService.getAllJokes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_sweep_sharp,
              size: 39,
              color: Colors.brown,
            ),
            onPressed: () {
              setState(() {
                HiveService.deleteAllJokes();
                listJokes = HiveService.getAllJokes();
              });
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: listJokes.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(9),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.amber),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    listJokes[index].value,
                    style: const TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        HiveService.removeJoke(index);
                        listJokes = HiveService.getAllJokes();
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 34,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
