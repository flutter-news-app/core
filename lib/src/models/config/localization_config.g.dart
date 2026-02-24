// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizationConfig _$LocalizationConfigFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LocalizationConfig', json, ($checkedConvert) {
      final val = LocalizationConfig(
        enabledLanguages: $checkedConvert(
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
      'supportedLanguages': instance.enabledLanguages
          .map((e) => _$ContentLanguageEnumMap[e]!)
          .toList(),
      'defaultLanguage': _$ContentLanguageEnumMap[instance.defaultLanguage]!,
    };

const _$ContentLanguageEnumMap = {
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
