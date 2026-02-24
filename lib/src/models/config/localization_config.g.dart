// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizationConfig _$LocalizationConfigFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LocalizationConfig', json, ($checkedConvert) {
      final val = LocalizationConfig(
        supportedLanguages: $checkedConvert(
          'supportedLanguages',
          (v) => (v as List<dynamic>)
              .map((e) => $enumDecode(_$ContentLanguageEnumMap, e))
              .toList(),
        ),
        defaultLanguage: $checkedConvert(
          'defaultLanguage',
          (v) => $enumDecode(_$ContentLanguageEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LocalizationConfigToJson(LocalizationConfig instance) =>
    <String, dynamic>{
      'supportedLanguages': instance.supportedLanguages
          .map((e) => _$ContentLanguageEnumMap[e]!)
          .toList(),
      'defaultLanguage': _$ContentLanguageEnumMap[instance.defaultLanguage]!,
    };

const _$ContentLanguageEnumMap = {
  ContentLanguage.en: 'en',
  ContentLanguage.es: 'es',
  ContentLanguage.fr: 'fr',
  ContentLanguage.ar: 'ar',
  ContentLanguage.pt: 'pt',
  ContentLanguage.de: 'de',
  ContentLanguage.it: 'it',
  ContentLanguage.zh: 'zh',
  ContentLanguage.hi: 'hi',
  ContentLanguage.ja: 'ja',
};
