// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Country',
  json,
  ($checkedConvert) {
    final val = Country(
      isoCode: $checkedConvert('isoCode', (v) => v as String),
      name: $checkedConvert(
        'name',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$SupportedLanguageEnumMap, k), e as String),
        ),
      ),
      flagUrl: $checkedConvert('flagUrl', (v) => v as String),
      id: $checkedConvert('id', (v) => v as String),
    );
    return val;
  },
);

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
  'id': instance.id,
  'isoCode': instance.isoCode,
  'name': instance.name.map(
    (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
  ),
  'flagUrl': instance.flagUrl,
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
