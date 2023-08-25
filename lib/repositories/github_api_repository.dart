import 'dart:convert';
import 'dart:io';

import '../models/github_repository.dart';
import 'package:http/http.dart' as http;

class GithubApiRepository {
  GithubApiRepository._();

  GithubApiRepository.init();

  final http.Client _client = http.Client();
  final Uri _githubUri = Uri.https('api.github.com');

  Future<List<GithubRepository>> gerRepositories({required String byName, int perPage = 15, int page = 1}) async {
    try {
      http.Response response = await _client.get(
        Uri(
          scheme: _githubUri.scheme,
          host: _githubUri.host,
          path: '/search/repositories',
          queryParameters: {
            "q": Uri.encodeQueryComponent(byName),
            "per_page": perPage.toString(),
            "page": page.toString(),
          },
        ),
      );
      if (response.statusCode != HttpStatus.ok) throw HttpException(response.body);
      return (jsonDecode(response.body)["items"] as List<dynamic>).map((itemMap) => GithubRepository.fromJson(itemMap)).toList();
    } catch (e) {
      print("ERROR: $e");
    }
    return [];
  }
}
