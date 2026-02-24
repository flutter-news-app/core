// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Comment', json, ($checkedConvert) {
      final val = Comment(
        language: $checkedConvert(
          'language',
          (v) => $enumDecode(_$SupportedLanguageEnumMap, v),
        ),
        content: $checkedConvert('content', (v) => v as String),
        status: $checkedConvert(
          'status',
          (v) =>
              $enumDecodeNullable(_$ModerationStatusEnumMap, v) ??
              ModerationStatus.pendingReview,
        ),
      );
      return val;
    });

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
  'language': _$SupportedLanguageEnumMap[instance.language]!,
  'content': instance.content,
  'status': _$ModerationStatusEnumMap[instance.status]!,
};

const _$SupportedLanguageEnumMap = {
  SupportedLanguage.en: 'en',
  SupportedLanguage.es: 'es',
  SupportedLanguage.fr: 'fr',
  SupportedLanguage.ar: 'ar',
  SupportedLanguage.pt: 'pt',
  SupportedLanguage.de: 'de',
  SupportedLanguage.it: 'it',
  SupportedLanguage.zh: 'zh',
  SupportedLanguage.hi: 'hi',
  SupportedLanguage.ja: 'ja',
};

const _$ModerationStatusEnumMap = {
  ModerationStatus.pendingReview: 'pendingReview',
  ModerationStatus.resolved: 'resolved',
};
