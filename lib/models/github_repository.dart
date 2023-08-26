import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repository.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class GithubRepository {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  @JsonKey(name: 'full_name')
  final String fullName;

  @HiveField(3)
  final bool private;

  @HiveField(4)
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  GithubRepository(this.id, this.name, this.fullName, this.private, this.htmlUrl);

  factory GithubRepository.fromJson(Map<String, dynamic> json) => _$GithubRepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$GithubRepositoryToJson(this);

  // It only makes sense to compare the id
  @override
  bool operator ==(Object other) => identical(this, other) || other is GithubRepository && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
