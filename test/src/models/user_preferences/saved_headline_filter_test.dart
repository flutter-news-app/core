import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('SavedHeadlineFilter', () {
    final fullModel = getSavedHeadlineFiltersFixturesData()[0];
    final fullJson = fullModel.toJson();

    test('should be instantiable', () {
      expect(fullModel, isA<SavedHeadlineFilter>());
    });

    test('should be equal to another instance with the same values', () {
      final otherModel = SavedHeadlineFilter(
        id: fullModel.id,
        userId: fullModel.userId,
        name: fullModel.name,
        isPinned: fullModel.isPinned,
        deliveryTypes: fullModel.deliveryTypes,
        criteria: fullModel.criteria,
      );
      expect(fullModel, equals(otherModel));
    });

    test('should have the correct props', () {
      expect(
        fullModel.props,
        equals([
          fullModel.id,
          fullModel.userId,
          fullModel.name,
          fullModel.criteria,
          fullModel.isPinned,
          fullModel.deliveryTypes,
        ]),
      );
    });

    test('should correctly deserialize from json', () {
      expect(SavedHeadlineFilter.fromJson(fullJson), equals(fullModel));
    });

    test('should correctly serialize to json', () {
      expect(fullModel.toJson(), equals(fullJson));
    });

    test('copyWith should work correctly', () {
      final copied = fullModel.copyWith(
        name: {SupportedLanguage.en: 'New Name'},
        isPinned: false,
      );

      expect(copied.name, {SupportedLanguage.en: 'New Name'});
      expect(copied.isPinned, false);
      expect(copied.id, fullModel.id);
      expect(copied.userId, fullModel.userId);
      expect(copied.criteria, fullModel.criteria);
      expect(copied.deliveryTypes, fullModel.deliveryTypes);
    });

    test('copyWith with no arguments should return an identical instance', () {
      final copied = getSavedHeadlineFiltersFixturesData()[0].copyWith();
      expect(copied, equals(fullModel));
    });

    test('should handle empty deliveryTypes set', () {
      const model = SavedHeadlineFilter(
        id: 'filter2',
        userId: 'user2',
        name: {SupportedLanguage.en: 'Test Filter'},
        isPinned: false,
        deliveryTypes: {},
        criteria: HeadlineFilterCriteria(
          topics: [],
          sources: [],
          countries: [],
          persons: [],
        ),
      );
      final json = model.toJson();
      final deserialized = SavedHeadlineFilter.fromJson(json);
      expect(deserialized, model);
      expect(deserialized.deliveryTypes, isEmpty);
    });
  });
}
