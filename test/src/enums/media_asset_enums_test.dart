import 'package:core/src/enums/media_asset_enums.dart';
import 'package:test/test.dart';

void main() {
  group('MediaAssetEntityType', () {
    test('has correct values', () {
      expect(MediaAssetEntityType.values, [
        MediaAssetEntityType.user,
        MediaAssetEntityType.headline,
        MediaAssetEntityType.topic,
        MediaAssetEntityType.source,
        MediaAssetEntityType.person,
      ]);
    });
  });

  group('MediaAssetPurpose', () {
    test('has correct values', () {
      expect(MediaAssetPurpose.values, [
        MediaAssetPurpose.userProfilePhoto,
        MediaAssetPurpose.headlineImage,
        MediaAssetPurpose.topicImage,
        MediaAssetPurpose.sourceImage,
        MediaAssetPurpose.personPhoto,
      ]);
    });
  });

  group('MediaAssetStatus', () {
    test('has correct values', () {
      expect(MediaAssetStatus.values, [
        MediaAssetStatus.pendingUpload,
        MediaAssetStatus.completed,
        MediaAssetStatus.failed,
      ]);
    });
  });
}
