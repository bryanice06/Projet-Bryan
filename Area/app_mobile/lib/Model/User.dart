

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '')
  String email;
  String password;
  String userName;



  User(this.email, this.password, this.userName);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}