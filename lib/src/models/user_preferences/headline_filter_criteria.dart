import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'headline_filter_criteria.g.dart';

/// {@template headline_filter_criteria}
/// A value object that encapsulates the filtering criteria for a
/// [SavedHeadlineFilter].
///
/// This model groups the content-based filters (topics, sources, and
/// countries) into a single, reusable object. It uses full entity models
/// to represent the selected criteria.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class HeadlineFilterCriteria extends Equatable {
  /// {@macro headline_filter_criteria}
  const HeadlineFilterCriteria({
    required this.topics,
    required this.sources,
    required this.countries,
    required this.persons,
  });

  /// Creates an [HeadlineFilterCriteria] from JSON data.
  factory HeadlineFilterCriteria.fromJson(Map<String, dynamic> json) =>
      _$HeadlineFilterCriteriaFromJson(json);

  /// The list of topics to include in the filter.
  /// An empty list means no topic filter is applied.
  final List<Topic> topics;

  /// The list of sources to include in the filter.
  /// An empty list means no source filter is applied.
  final List<Source> sources;

  /// The list of countries to include in the filter.
  /// An empty list means no country filter is applied.
  final List<Country> countries;

  /// The list of persons to include in the filter.
  final List<Person> persons;

  /// Converts this [HeadlineFilterCriteria] instance to JSON data.
  Map<String, dynamic> toJson() => _$HeadlineFilterCriteriaToJson(this);

  @override
  List<Object> get props => [topics, sources, countries, persons];

  /// Creates a copy of this [HeadlineFilterCriteria] but with the given fields
  /// replaced with the new values.
  HeadlineFilterCriteria copyWith({
    List<Topic>? topics,
    List<Source>? sources,
    List<Country>? countries,
    List<Person>? persons,
  }) {
    return HeadlineFilterCriteria(
      topics: topics ?? this.topics,
      sources: sources ?? this.sources,
      countries: countries ?? this.countries,
      persons: persons ?? this.persons,
    );
  }
}
