import 'package:json_annotation/json_annotation.dart';

part 'github_repository.g.dart';

@JsonSerializable()
class GithubRepository {
  final int id;
  final String name;
  @JsonKey(name: 'full_name')
  final String fullName;
  final bool private;
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  GithubRepository(this.id, this.name, this.fullName, this.private, this.htmlUrl);

  factory GithubRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryFromJson(json);
  Map<String, dynamic> toJson() => _$GithubRepositoryToJson(this);

  // It only makes sense to compare the id
  @override
  bool operator ==(Object other) => identical(this, other) || other is GithubRepository && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}