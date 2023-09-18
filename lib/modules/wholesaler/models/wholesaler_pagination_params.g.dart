// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wholesaler_pagination_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

wholesalerPaginationParams _$ExpertsPaginationParamsFromJson(
        Map<String, dynamic> json) =>
    wholesalerPaginationParams(
      page: json['page'] as int?,
      mainCategoryId: json['mainCategoryId'] as int?,
      subCategoryId: json['subCategoryId'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$ExpertsPaginationParamsToJson(
    wholesalerPaginationParams instance) =>
    <String, dynamic>{
      'page': instance.page,
      'mainCategoryId': instance.mainCategoryId,
      'subCategoryId': instance.subCategoryId,
      'limit': instance.limit,
    };
