import 'package:flutter/material.dart';
import 'package:lesson52_practice_provider_chuknorris/providers/joke_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<JokeProvider>();

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
              vm.removeAllFavorites();
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: vm.favoriteJokes.length,
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
                    vm.favoriteJokes[index].value ?? '',
                    style: const TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      vm.removeFromFavorites(joke: vm.favoriteJokes[index]);
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
