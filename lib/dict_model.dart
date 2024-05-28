import 'package:json_annotation/json_annotation.dart';

part 'dict_model.g.dart';

@JsonSerializable()
class DictModel {
  String? word;
  String? phonetic;
  List<Meaning>? meanings;

  DictModel({
    this.word,
    this.phonetic,
    this.meanings,
  });

  factory DictModel.fromJson(Map<String, dynamic> json) =>
      _$DictModelFromJson(json);
  Map<String, dynamic> toJson() => _$DictModelToJson(this);
}

@JsonSerializable()
class Meaning {
  String? partOfSpeech;
  List<Definition>? definitions;
  List<String>? synonyms;
  List<String>? atonyms;

  Meaning({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.atonyms,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) =>
      _$MeaningFromJson(json);
  Map<String, dynamic> toJson() => _$MeaningToJson(this);
}

@JsonSerializable()
class Definition {
  String? definition;

  Definition({
    this.definition,
  });

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
  Map<String, dynamic> toJson() => _$DefinitionToJson(this);
}
