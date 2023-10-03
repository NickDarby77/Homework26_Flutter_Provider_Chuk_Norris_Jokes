import 'package:hive/hive.dart';
import 'package:lesson52_practice_provider_chuknorris/hive/hive_joke_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  static initHive() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(
        HiveJokeModelAdapter(),
      );
    Hive.openBox<HiveJokeModel>('joke');
  }

  static void addJoke(HiveJokeModel joke) {
    Hive.box<HiveJokeModel>('joke').add(joke);
  }

  static List<HiveJokeModel> getAllJokes() {
    return Hive.box<HiveJokeModel>('joke').values.toList();
  }

  static void removeJoke(int index) {
    Hive.box<HiveJokeModel>('joke').deleteAt(index);
  }

  static void deleteAllJokes() {
    Hive.box<HiveJokeModel>('joke').clear();
  }
}
