// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Publics _$PublicsFromJson(Map<String, dynamic> json) {
  return Publics()
    ..count = json['count'] as num
    ..entries = (json['entries'] as List)
        ?.map((e) =>
            e == null ? null : Public.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PublicsToJson(Publics instance) =>
    <String, dynamic>{'count': instance.count, 'entries': instance.entries};
