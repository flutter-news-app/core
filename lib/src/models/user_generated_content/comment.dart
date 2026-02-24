import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'comment.g.dart';

/// {@template user_comment}
/// A value object representing the comment content within an [Engagement].
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Comment extends Equatable {
  /// {@macro user_comment}
  const Comment({
    required this.language,
    required this.content,
    this.status = ModerationStatus.pendingReview,
  });

  /// Creates a [Comment] from JSON data.
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  /// The language of the comment.
  final SupportedLanguage language;

  /// The text content of the comment.
  final String content;

  /// The current moderation status of the comment.
  final ModerationStatus status;

  /// Converts this [Comment] instance to JSON data.
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  List<Object> get props => [language, content, status];

  /// Creates a copy of this [Comment] with updated values.
  Comment copyWith({
    String? content,
    SupportedLanguage? language,
    ModerationStatus? status,
  }) {
    return Comment(
      language: language ?? this.language,
      content: content ?? this.content,
      status: status ?? this.status,
    );
  }
}
