// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanyVO _$ProductionCompanyVOFromJson(Map<String, dynamic> json) =>
    ProductionCompanyVO(
      json['id'] as int?,
      json['logo_path'] as String?,
      json['name'] as String?,
      json['origin_country'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyVOToJson(
        ProductionCompanyVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPart,
      'name': instance.name,
      'origin_country': instance.originalCountry,
    };
