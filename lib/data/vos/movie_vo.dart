import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_1/data/vos/collection_vo.dart';
import 'package:movie_app_1/data/vos/genre_vo.dart';
import 'package:movie_app_1/data/vos/production_company_vo.dart';
import 'package:movie_app_1/data/vos/production_country_vo.dart';
import 'package:movie_app_1/data/vos/spoken_language_vo.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
class MovieVO {
  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "backdrop_path")
  String? backDropPath;

  @JsonKey(name: "genre_ids")
  List<int>? genreIds;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "original_language")
  String? originalLanguage;

  @JsonKey(name: "original_title")
  String? originalTitle;

  @JsonKey(name: "overview")
  String? overview;

  @JsonKey(name: "popularity")
  double? popularity;

  @JsonKey(name: "poster_path")
  String? posterPath;

  @JsonKey(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "video")
  bool? video;

  @JsonKey(name: "vote_average")
  double? voteAverage;

  @JsonKey(name: "vote_count")
  int? voteCount;

  @JsonKey(name: "belongs_to_collection")
  CollectionVO? belongsToCollection;

  @JsonKey(name: "budget")
  double? budget;

  @JsonKey(name: "genres")
  List<GenreVO>? genres;

  @JsonKey(name: "homepage")
  String? homePage;

  @JsonKey(name: "imdb_id")
  String? imdbId;

  @JsonKey(name: "production_companies")
  List<ProductionCompanyVO>? productionCompanies;

  @JsonKey(name: "production_countries")
  List<ProductionCountryVO>? productionCountries;

  @JsonKey(name: "revenue")
  int? revenue;

  @JsonKey(name: "runtime")
  int? runtime;

  @JsonKey(name: "spoken_languages")
  List<SpokenLanguageVO>? spokenLanguages;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "tagline")
  String? tagLine;

  MovieVO(
      this.adult,
      this.backDropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homePage,
      this.imdbId,
      this.productionCompanies,
      this.productionCountries,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagLine);

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  String? getGenreListAsCommaSepratedString() {
    return genres?.map((genre) => genre.name ?? "").toList().join(",") ?? "";
  }

  List<String>? getGenreListAsStringList() {
    return genres?.map((genre) => genre.name ?? "").toList() ?? [];
  }

  String? getProductionCountriesAsCommaSepreatedString() {
    return productionCountries
            ?.map((country) => country.name ?? "")
            .toList()
            .join(",") ??
        "";
  }

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backDropPath: $backDropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount}';
  }
}
