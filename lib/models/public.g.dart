// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Public _$PublicFromJson(Map<String, dynamic> json) {
  return Public()
    ..API = json['API'] as String
    ..Description = json['Description'] as String
    ..Auth = json['Auth'] as String
    ..HTTPS = json['HTTPS'] as bool
    ..Cors = json['Cors'] as String
    ..Link = json['Link'] as String
    ..Category = json['Category'] as String;
}

Map<String, dynamic> _$PublicToJson(Public instance) => <String, dynamic>{
      'API': instance.API,
      'Description': instance.Description,
      'Auth': instance.Auth,
      'HTTPS': instance.HTTPS,
      'Cors': instance.Cors,
      'Link': instance.Link,
      'Category': instance.Category
    };
