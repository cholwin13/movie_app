import 'package:json_annotation/json_annotation.dart';

import 'movie_vo.dart';

part 'actor_vo.g.dart';

@JsonSerializable()
class ActorVO {
  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "known_for")
  List<MovieVO>? known_for;

  @JsonKey(name: "popularity")
  double? popularity;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "profile_path")
  String? profile_path;

  @JsonKey(name: "known_for_department")
  String? knownForDepartment;

  @JsonKey(name: "original_name")
  String? originalName;

  @JsonKey(name: "cast_id")
  String? castId;

  @JsonKey(name: "character")
  String? character;

  @JsonKey(name: "credit_id")
  String? creditId;

  @JsonKey(name: "order")
  int? order;

  ActorVO(
      this.adult,
      this.id,
      this.known_for,
      this.popularity,
      this.name,
      this.profile_path,
      this.knownForDepartment,
      this.originalName,
      this.castId,
      this.character,
      this.creditId,
      this.order);

  factory ActorVO.fromJson(Map<String, dynamic> json) =>
      _$ActorVOFromJson(json);

  Map<String, dynamic> toJson() => _$ActorVOToJson(this);
}
