import 'package:json_annotation/json_annotation.dart';

/// {@template limited_action}
/// Defines the specific type of content-related action a user is trying to
/// perform, which may be subject to limitations.
/// {@endtemplate}
@JsonEnum()
enum LimitedAction {
  /// The action of bookmarking a headline.
  @JsonValue('bookmarkHeadline')
  bookmarkHeadline,

  /// The action of following a topic.
  @JsonValue('followTopic')
  followTopic,

  /// The action of following a source.
  @JsonValue('followSource')
  followSource,

  /// The action of following a country.
  @JsonValue('followCountry')
  followCountry,

  /// The action of following a person.
  @JsonValue('followPerson')
  followPerson,

  /// The action of saving a filter.
  @JsonValue('saveFilter')
  saveFilter,

  /// The action of pinning a filter.
  @JsonValue('pinFilter')
  pinFilter,

  /// The action of subscribing to notifications for a saved filter.
  @JsonValue('subscribeToSavedFilterNotifications')
  subscribeToSavedFilterNotifications,

  /// The action of posting a comment.
  @JsonValue('postComment')
  postComment,

  /// The action of reacting to a piece of content.
  @JsonValue('reactToContent')
  reactToContent,

  /// The action of submitting a report.
  @JsonValue('submitReport')
  submitReport,
}
