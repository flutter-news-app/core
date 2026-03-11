import 'package:core/core.dart' show Headline, Person, Source, Topic, User;
import 'package:core/src/models/media/media_asset.dart' show MediaAsset;
import 'package:core/src/models/models.dart'
    show Headline, Person, Source, Topic, User;
import 'package:json_annotation/json_annotation.dart';

/// {@template media_asset_entity_type}
/// Defines the type of entity a media asset can be associated with.
///
/// This is used to create a polymorphic relationship between a [MediaAsset]
/// and other models like [Headline], [Topic], or [Source].
/// {@endtemplate}
@JsonEnum()
enum MediaAssetEntityType {
  /// The asset is associated with a [User].
  user,

  /// The asset is associated with a [Headline].
  headline,

  /// The asset is associated with a [Topic].
  topic,

  /// The asset is associated with a [Source].
  source,

  /// The asset is associated with a [Person].
  person,
}

/// {@template media_asset_purpose}
/// Defines the intended use of a media asset.
///
/// This is used to apply different logic or validation based on where the
/// media will be used (e.g., a user's profile picture vs. a headline image).
/// {@endtemplate}
@JsonEnum()
enum MediaAssetPurpose {
  /// The media is intended for use as a user's profile photo.
  userProfilePhoto,

  /// The media is intended for use as a headline's main image.
  headlineImage,

  /// The media is intended for use as a topic's icon.
  topicImage,

  /// The media is intended for use as a source's logo.
  sourceImage,

  /// The media is intended for use as a person's photo.
  personPhoto,
}

/// {@template media_asset_status}
/// Defines the lifecycle status of a media asset during the upload process.
/// {@endtemplate}
@JsonEnum()
enum MediaAssetStatus {
  /// The upload has been requested, and a signed URL has been generated,
  /// but the file has not yet been uploaded to the storage provider.
  pendingUpload,

  /// The file has been successfully uploaded to the storage provider, and the
  /// webhook confirmation has been received.
  completed,

  /// The upload process failed.
  failed,
}
