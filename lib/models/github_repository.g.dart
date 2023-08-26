// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GithubRepositoryAdapter extends TypeAdapter<GithubRepository> {
  @override
  final int typeId = 0;

  @override
  GithubRepository read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GithubRepository(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as bool,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GithubRepository obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.private)
      ..writeByte(4)
      ..write(obj.htmlUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GithubRepositoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
