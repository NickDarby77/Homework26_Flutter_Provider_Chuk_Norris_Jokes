import 'package:flutter/material.dart';
import 'package:lesson52_practice_provider_chuknorris/hive/hive_joke_model.dart';
import 'package:lesson52_practice_provider_chuknorris/hive/hive_service.dart';
import 'package:lesson52_practice_provider_chuknorris/providers/joke_provider.dart';
import 'package:lesson52_practice_provider_chuknorris/ui/favorites_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<JokeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuk Norris Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(19),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  vm.model.value ?? '',
                  style: const TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 9),
                vm.model.value != null
                    ? IconButton(
                        onPressed: () {
                          HiveService.addJoke(
                            HiveJokeModel(
                              categories: vm.model.categories ?? [],
                              createdAt: vm.model.createdAt ?? '',
                              iconUrl: vm.model.iconUrl ?? '',
                              id: vm.model.id ?? '',
                              updatedAt: vm.model.updatedAt ?? '',
                              url: vm.model.url ?? '',
                              value: vm.model.value ?? '',
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 55,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 20),
                SizedBox(
                  height: 55,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      vm.getJoke();
                    },
                    child: const Text(
                      'Get Joke',
                      style: TextStyle(fontSize: 29),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FavoritesPage(),
            ),
          );
        },
        child: const Icon(
          Icons.list,
          size: 35,
        ),
      ),
    );
  }
}
