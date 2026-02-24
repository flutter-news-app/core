// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizationConfig _$LocalizationConfigFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LocalizationConfig', json, ($checkedConvert) {
      final val = LocalizationConfig(
        enabledLanguages: $checkedConvert(
          'enabledLanguages',
          (v) => (v as List<dynamic>)
              .map((e) => $enumDecode(_$SupportedLanguageEnumMap, e))
              .toList(),
        ),
        defaultLanguage: $checkedConvert(
          'defaultLanguage',
          (v) => $enumDecode(_$SupportedLanguageEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LocalizationConfigToJson(LocalizationConfig instance) =>
    <String, dynamic>{
      'enabledLanguages': instance.enabledLanguages
          .map((e) => _$SupportedLanguageEnumMap[e]!)
          .toList(),
      'defaultLanguage': _$SupportedLanguageEnumMap[instance.defaultLanguage]!,
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
