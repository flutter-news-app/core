import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('NewsAutomationTask', () {
    final now = DateTime.now();
    final task = NewsAutomationTask(
      id: '1',
      sourceId: 'src_123',
      fetchInterval: FetchInterval.hourly,
      status: IngestionStatus.active,
      createdAt: now,
      updatedAt: now,
    );

    test('supports value equality', () {
      expect(
        task,
        equals(
          NewsAutomationTask(
            id: '1',
            sourceId: 'src_123',
            fetchInterval: FetchInterval.hourly,
            status: IngestionStatus.active,
            createdAt: now,
            updatedAt: now,
          ),
        ),
      );
    });

    test('fromJson/toJson works correctly', () {
      expect(NewsAutomationTask.fromJson(task.toJson()), equals(task));
    });

    test('copyWith updates fields correctly', () {
      final updated = task.copyWith(
        status: IngestionStatus.error,
        failureCount: 5,
        lastErrorMessage: const ValueWrapper('Timeout'),
      );

      expect(updated.status, equals(IngestionStatus.error));
      expect(updated.failureCount, equals(5));
      expect(updated.lastErrorMessage, equals('Timeout'));
      expect(updated.id, equals(task.id));
    });

    test('copyWith handles null values via ValueWrapper', () {
      final taskWithRun = task.copyWith(lastRunAt: ValueWrapper(now));
      final cleared = taskWithRun.copyWith(lastRunAt: const ValueWrapper(null));
      expect(cleared.lastRunAt, isNull);
    });
  });
}
