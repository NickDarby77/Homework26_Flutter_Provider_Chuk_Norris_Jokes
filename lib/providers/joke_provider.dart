import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lesson52_practice_provider_chuknorris/dio_settings/dio_settings.dart';
import 'package:lesson52_practice_provider_chuknorris/models/joke_model.dart';

class JokeProvider extends ChangeNotifier {
  final Dio dio = DioSettings().dio;
  JokeModel model = JokeModel();

  List<JokeModel> favoriteJokes = [];

  Future<void> getJoke() async {
    final Response response = await dio.get(
      'https://api.chucknorris.io/jokes/random',
    );
    model = JokeModel.fromJson(response.data);
    notifyListeners();
  }

  void addToFavorites({required JokeModel joke}) {
    if (!favoriteJokes.contains(joke)) {
      favoriteJokes.add(joke);
      notifyListeners();
    }
  }

  void removeFromFavorites({required JokeModel joke}) {
    favoriteJokes.remove(joke);
    notifyListeners();
  }

  void removeAllFavorites() {
    favoriteJokes.clear();
    notifyListeners();
  }

  // void addToFavorites({required JokeModel joke}) {
  //   bool isJokeInFavorites = false;

  //   for (int i = 0; i < favoriteJokes.length; i++) {
  //     if (favoriteJokes[i].value == joke.value) {
  //       isJokeInFavorites = true;
  //       break;
  //     }
  //   }

  //   if (!isJokeInFavorites) {
  //     favoriteJokes.add(joke);
  //   }
  //   notifyListeners();
  // }
}
