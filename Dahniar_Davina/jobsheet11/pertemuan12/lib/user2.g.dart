// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'createdAt'],
    disallowNullValues: const ['id', 'name'],
  );
  return User(
    id: (json['id'] as num).toInt(),
    name: json['name'] as String,
    createdAt: User._parseDateTime(json['createdAt']),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'createdAt': User._dateTimeToJson(instance.createdAt),
};
