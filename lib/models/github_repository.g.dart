// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepository _$GithubRepositoryFromJson(Map<String, dynamic> json) =>
    GithubRepository(
      json['id'] as int,
      json['name'] as String,
      json['full_name'] as String,
      json['private'] as bool,
      json['html_url'] as String,
    );

Map<String, dynamic> _$GithubRepositoryToJson(GithubRepository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'html_url': instance.htmlUrl,
    };
