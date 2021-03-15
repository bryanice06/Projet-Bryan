

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'Cards.g.dart';


@JsonSerializable()
class CardsList {
  @JsonKey(name: "data")
  List<Cards> list;


  CardsList(this.list);

  factory CardsList.fromJson(Map<String, dynamic> json) => _$CardListFromJson(json);

  Map<String, dynamic> toJson() => _$CardListToJson(this);
}

@JsonSerializable()
class Cards {
  @JsonKey(name: '')
  String name;
  String ServiceAction;
  String Action;
  String ActionInfo;
  String ServiceReaction;
  String Reaction;
  String ReactionInfo;

  Cards(
      this.name,
      this.ServiceAction,
      this.Action,
      this.ActionInfo,
      this.ServiceReaction,
      this.Reaction,
      this.ReactionInfo
      );

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);

  Map<String, dynamic> toJson() => _$CardsToJson(this);
}