import 'package:json_annotation/json_annotation.dart';

part 'public.g.dart';

@JsonSerializable()
class Public {
    Public();

    String API;
    String Description;
    String Auth;
    bool HTTPS;
    String Cors;
    String Link;
    String Category;
    
    factory Public.fromJson(Map<String,dynamic> json) => _$PublicFromJson(json);
    Map<String, dynamic> toJson() => _$PublicToJson(this);
}
