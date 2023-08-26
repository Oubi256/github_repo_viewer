import 'package:flutter/cupertino.dart';
import 'package:github_repo_viewer/models/github_repository.dart';
import 'package:hive_flutter/adapters.dart';

class HiveRepository {
  HiveRepository._();

  ValueNotifier<bool> isInitialized = ValueNotifier(false);

  HiveRepository.init() {
    _init();
  }

  late final Box<dynamic> box;

  Future<void> _init() async {
    await Hive.initFlutter();
    _registerAdapters();
    box = await Hive.openBox('app_content');
    isInitialized.value = true;
  }

  void _registerAdapters() {
    Hive.registerAdapter((GithubRepositoryAdapter()));
  }

  Future<void> saveContent(String key, dynamic value) async {
    try {
      await box.put(key, value);
      final map = box.toMap();
      print("saved: ${map[key]}");

      //logger.i("| 🐝 - Content successfully saved to local storage");
    } catch (error) {
      print("saved error");
      //logger.e("| 🐝 - $error");
    }
  }

  Future<dynamic> getContent(String key) async {
    try {
      await box.get(key);
      final map = box.toMap();
      print("map: ${map.keys}");
      print("getCont: ${map[key]}");
      return map[key];

      //logger.i("| 🐝 - Content successfully loaded from local storage");
      print("loaded");
    } catch (error) {
      print("loaded error: $error");
      //logger.e("| 🐝 - $error");
    }
  }
}
