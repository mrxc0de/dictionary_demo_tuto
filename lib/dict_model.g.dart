// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dict_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictModel _$DictModelFromJson(Map<String, dynamic> json) => DictModel(
      word: json['word'] as String?,
      phonetic: json['phonetic'] as String?,
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meaning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DictModelToJson(DictModel instance) => <String, dynamic>{
      'word': instance.word,
      'phonetic': instance.phonetic,
      'meanings': instance.meanings,
    };

Meaning _$MeaningFromJson(Map<String, dynamic> json) => Meaning(
      partOfSpeech: json['partOfSpeech'] as String?,
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      atonyms:
          (json['atonyms'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MeaningToJson(Meaning instance) => <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
      'synonyms': instance.synonyms,
      'atonyms': instance.atonyms,
    };

Definition _$DefinitionFromJson(Map<String, dynamic> json) => Definition(
      definition: json['definition'] as String?,
    );

Map<String, dynamic> _$DefinitionToJson(Definition instance) =>
    <String, dynamic>{
      'definition': instance.definition,
    };
