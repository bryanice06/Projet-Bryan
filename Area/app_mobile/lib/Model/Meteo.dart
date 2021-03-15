

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'Meteo.g.dart';

@JsonSerializable()
class Meteo {
  @JsonKey(name: '')
  String email;
  String password;
  String MeteoName;



  Meteo(this.email, this.password, this.MeteoName);

  factory Meteo.fromJson(Map<String, dynamic> json) => _$MeteoFromJson(json);

  Map<String, dynamic> toJson() => _$MeteoToJson(this);
}