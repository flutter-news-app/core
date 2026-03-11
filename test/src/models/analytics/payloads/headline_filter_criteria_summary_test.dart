import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('HeadlineFilterCriteriaSummary', () {
    final topicsFixture = getTopicsFixturesData().take(2).toList();
    final sourcesFixture = getSourcesFixturesData().take(1).toList();

    final criteria = HeadlineFilterCriteria(
      topics: topicsFixture,
      sources: sourcesFixture,
      countries: const [],
      persons: const [],
    );

    const summary = HeadlineFilterCriteriaSummary(
      criteriaTypes: ['source', 'topic'],
      topicCount: 2,
      sourceCount: 1,
      countryCount: 0,
    );

    group('fromCriteria factory', () {
      test('should correctly create a summary from HeadlineFilterCriteria', () {
        final generatedSummary = HeadlineFilterCriteriaSummary.fromCriteria(
          criteria,
        );

        // Create new, sorted lists for comparison to avoid modifying
        // unmodifiable lists.
        final sortedGeneratedTypes = List<String>.from(
          generatedSummary.criteriaTypes,
        )..sort();
        final sortedExpectedTypes = List<String>.from(summary.criteriaTypes)
          ..sort();

        expect(sortedGeneratedTypes, equals(sortedExpectedTypes));
        expect(generatedSummary.topicCount, summary.topicCount);
        expect(generatedSummary.sourceCount, summary.sourceCount);
        expect(generatedSummary.countryCount, summary.countryCount);
      });

      test('should handle empty criteria', () {
        const emptyCriteria = HeadlineFilterCriteria(
          topics: [],
          sources: [],
          countries: [],
          persons: [],
        );
        final generatedSummary = HeadlineFilterCriteriaSummary.fromCriteria(
          emptyCriteria,
        );
        expect(generatedSummary.criteriaTypes, isEmpty);
        expect(generatedSummary.topicCount, 0);
        expect(generatedSummary.sourceCount, 0);
        expect(generatedSummary.countryCount, 0);
      });
    });

    group('toJson', () {
      test('should correctly serialize to JSON', () {
        final json = summary.toJson();
        expect(json, {
          'criteriaTypes': ['source', 'topic'],
          'topicCount': 2,
          'sourceCount': 1,
          'countryCount': 0,
        });
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        const instance1 = summary;
        const instance2 = HeadlineFilterCriteriaSummary(
          criteriaTypes: ['source', 'topic'],
          topicCount: 2,
          sourceCount: 1,
          countryCount: 0,
        );
        expect(instance1, equals(instance2));
      });

      test('should not equate instances with different properties', () {
        const instance1 = summary;
        const instance2 = HeadlineFilterCriteriaSummary(
          criteriaTypes: ['topic'],
          topicCount: 1,
          sourceCount: 0,
          countryCount: 0,
        );
        expect(instance1, isNot(equals(instance2)));
      });
    });
  });
}
