
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Meteo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meteo _$MeteoFromJson(Map<String, dynamic> json) {
  return Meteo(
    json['email'] as String,
    json['password'] as String,
    json['Meteoname'] as String,
  );
}

Map<String, dynamic> _$MeteoToJson(Meteo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'Meteoname': instance.MeteoName,
    };