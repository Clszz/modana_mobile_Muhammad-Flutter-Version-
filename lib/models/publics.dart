import 'package:json_annotation/json_annotation.dart';
import "public.dart";
part 'publics.g.dart';

@JsonSerializable()
class Publics {
    Publics();

    num count;
    List<Public> entries;
    
    factory Publics.fromJson(Map<String,dynamic> json) => _$PublicsFromJson(json);
    Map<String, dynamic> toJson() => _$PublicsToJson(this);

    static Publics filterList(Publics publics, String filterString) {
    Publics tempPublics = publics;
    List<Public> _publics = tempPublics.entries
        .where((u) =>
            (u.Category.toLowerCase().contains(filterString.toLowerCase())))
        .toList();
    publics.entries = _publics;
    return publics;
  }
}
