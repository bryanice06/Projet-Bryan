
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardsList _$CardListFromJson(Map<String, dynamic> json) {
  return CardsList((json['body'] as List)
      ?.map(
          (e) => e == null ? null : Cards.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$CardListToJson(CardsList instance) =>
    <String, dynamic>{'body': instance.list};


Cards _$CardsFromJson(Map<String, dynamic> json) {


  return Cards(
    json['name'] as String,
    json['ServiceAction'] as String,
    json['Action'] as String,
    json['ActionInfo'] as String,
    json['ServiceReaction'] as String,
    json['Reaction'] as String,
    json['RectionInfo'] as String,
  );
}

Map<String, dynamic> _$CardsToJson(Cards instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ServiceAction': instance.ServiceAction,
      'Action': instance.Action,
      'ActionInfo': instance.ReactionInfo,
      'ServiceReaction': instance.ServiceReaction,
      'Reaction': instance.Reaction,
      'ReactionInfo': instance.ReactionInfo,
    };
