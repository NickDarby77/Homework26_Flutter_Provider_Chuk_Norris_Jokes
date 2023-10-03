import 'package:hive/hive.dart';
part 'hive_joke_model.g.dart';

@HiveType(typeId: 0)
class HiveJokeModel {
  @HiveField(0)
  List<String> categories;
  @HiveField(1)
  String createdAt;
  @HiveField(2)
  String iconUrl;
  @HiveField(3)
  String id;
  @HiveField(4)
  String updatedAt;
  @HiveField(5)
  String url;
  @HiveField(6)
  String value;

  HiveJokeModel(
      {required this.categories,
      required this.createdAt,
      required this.iconUrl,
      required this.id,
      required this.updatedAt,
      required this.url,
      required this.value});
}
