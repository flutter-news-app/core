import 'package:json_annotation/json_annotation.dart';

/// {@template chart_card_id}
/// Defines the unique, type-safe identifiers for each chart card available on
/// the dashboard.
///
/// Each ID corresponds to a specific chart on a specific management tab.
/// {@endtemplate}
@JsonEnum()
enum ChartCardId {
  // --- Onboarding & First-Time User Experience ---
  /// A bar chart representing a funnel, showing user progression through the pre-auth app tour
  /// steps.
  overviewAppTourFunnel,

  /// A bar chart representing a funnel, showing user progression and drop-off (skips) in the
  /// post-auth initial personalization flow.
  overviewInitialPersonalizationFunnel,

  // --- Users Management ---
  /// Chart for new user registrations over time.
  usersRegistrationsOverTime,

  /// Chart for active users over time.
  usersActiveUsersOverTime,

  /// Chart for user tier distribution (Guest, Standard, Premium).
  usersTierDistribution,

  // --- Content Management ---
  // Headlines Tab
  /// Chart for headline views over time.
  contentHeadlinesViewsOverTime,

  /// Chart for headline likes over time.
  contentHeadlinesLikesOverTime,

  /// Chart for headline views categorized by topic.
  contentHeadlinesViewsByTopic,

  // Sources Tab
  /// Chart for headlines published by sources over time.
  contentSourcesHeadlinesPublishedOverTime,

  /// A bar chart showing the count of news sources categorized by their
  /// ContentStatus (e.g., 'active', 'draft', 'archived'). This provides
  /// insight into the lifecycle and availability of your content sources.
  contentSourcesStatusDistribution,

  /// Chart for engagement by source type.
  contentSourcesEngagementByType,

  // Persons Tab
  /// Chart tracking how frequently persons are mentioned in headlines.
  contentPersonsMentionsOverTime,

  /// Chart for user engagement (likes/comments) categorized by person.
  contentPersonsEngagementByEntity,

  /// Chart for headline views categorized by person.
  contentHeadlinesViewsByPerson,

  // Topics Tab
  /// A bar chart showing the count of headlines categorized by whether they are
  /// marked as 'breaking news' (isBreaking: true) or not. This offers a view
  /// into the volume of urgent vs. regular content.
  contentHeadlinesBreakingNewsDistribution,

  /// Chart for headlines published per topic over time.
  contentTopicsHeadlinesPublishedOverTime,

  /// Chart for engagement by topic.
  contentTopicsEngagementByTopic,

  // --- Engagements Management ---
  // Engagements Tab (Reactions & Comments)
  /// Chart for reactions over time.
  engagementsReactionsOverTime,

  /// Chart for comments over time.
  engagementsCommentsOverTime,

  /// Chart for reactions by type.
  engagementsReactionsByType,

  // Reports Tab
  /// Chart for submitted reports over time.
  engagementsReportsSubmittedOverTime,

  /// Chart for average report resolution time.
  engagementsReportsResolutionTimeOverTime,

  /// Chart for reports by reason.
  engagementsReportsByReason,

  // App Reviews Tab
  /// Chart for feedback submissions over time.
  engagementsAppReviewsFeedbackOverTime,

  /// Chart for positive vs. negative feedback.
  engagementsAppReviewsPositiveVsNegative,

  /// Chart for store review requests over time.
  engagementsAppReviewsStoreRequestsOverTime,

  // --- Rewards Management ---
  /// A line chart showing the trend of ads watched for rewards over time.
  rewardsAdsWatchedOverTime,

  /// A line chart showing the trend of rewards successfully granted over time.
  rewardsGrantedOverTime,

  /// A bar chart showing the distribution of active rewards by type (e.g. Ad-Free vs Digest).
  rewardsActiveByType,

  // --- Media Management ---
  /// A line chart showing the trend of media uploads over time.
  mediaUploadsOverTime,

  /// A bar chart showing the distribution of uploads by their purpose.
  mediaUploadsByPurpose,

  /// A bar chart comparing successful vs. failed uploads.
  mediaUploadsSuccessVsFailure,

  // --- Ingestion Management ---
  /// A line chart showing the trend of headlines fetched over time.
  ingestionHeadlinesOverTime,

  /// A bar chart showing the distribution of automation tasks by status
  /// (active, paused, error). This provides a high-level view of
  /// pipeline health.
  ingestionTaskStatusDistribution,
}
