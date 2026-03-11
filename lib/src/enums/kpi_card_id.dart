import 'package:json_annotation/json_annotation.dart';

/// {@template kpi_card_id}
/// Defines the unique, type-safe identifiers for each KPI card available on
/// the dashboard.
///
/// Each ID corresponds to a specific metric card on a specific management tab.
/// {@endtemplate}
@JsonEnum()
enum KpiCardId {
  // --- Users Management ---
  /// KPI card for total registered users.
  usersTotalRegistered,

  /// KPI card for new user registrations.
  usersNewRegistrations,

  /// KPI card for active users.
  usersActiveUsers,

  // --- Content Management ---
  // Headlines Tab
  /// KPI card for total headlines published.
  contentHeadlinesTotalPublished,

  /// KPI card for total views on headlines.
  contentHeadlinesTotalViews,

  /// KPI card for total likes on headlines.
  contentHeadlinesTotalLikes,

  // Sources Tab
  /// KPI card for total unique sources.
  contentSourcesTotalSources,

  /// KPI card for new sources added.
  contentSourcesNewSources,

  /// KPI card for total followers across all sources.
  contentSourcesTotalFollowers,

  // Persons Tab
  /// KPI card for the total number of person records available in the system.
  contentPersonsTotal,

  /// KPI card for total followers across all persons.
  contentPersonsTotalFollowers,

  // Topics Tab
  /// KPI card for total unique topics.
  contentTopicsTotalTopics,

  /// KPI card for new topics added.
  contentTopicsNewTopics,

  /// KPI card for total followers across all topics.
  contentTopicsTotalFollowers,

  // --- Engagements Management ---
  // Engagements Tab (Reactions & Comments)
  /// KPI card for total reactions.
  engagementsTotalReactions,

  /// KPI card for total comments.
  engagementsTotalComments,

  /// KPI card for average engagement rate.
  engagementsAverageEngagementRate,

  // Reports Tab
  /// KPI card for reports pending review.
  engagementsReportsPending,

  /// KPI card for resolved reports.
  engagementsReportsResolved,

  /// KPI card for average report resolution time.
  engagementsReportsAverageResolutionTime,

  // App Reviews Tab
  /// KPI card for total app review feedback submissions.
  engagementsAppReviewsTotalFeedback,

  /// KPI card for positive feedback submissions.
  engagementsAppReviewsPositiveFeedback,

  /// KPI card for native store review requests made.
  engagementsAppReviewsStoreRequests,

  // --- Rewards Management ---
  /// KPI card for the total number of ads watched to earn rewards.
  rewardsAdsWatchedTotal,

  /// KPI card for the total number of rewards successfully granted (verified).
  rewardsGrantedTotal,

  /// KPI card for the number of users with currently active rewards.
  rewardsActiveUsersCount,

  // --- Media Management ---
  /// KPI card for the total number of media files uploaded.
  mediaTotalUploads,

  /// KPI card for the number of failed media uploads.
  mediaFailedUploads,

  /// KPI card for the average upload time in seconds.
  mediaAverageUploadTime,

  // --- Ingestion Management ---
  /// KPI card for the total number of active automation tasks.
  ingestionActiveTasks,

  /// KPI card for the number of automation tasks currently in 'error' state.
  ingestionFailedTasks,

  /// KPI card for the total number of headlines fetched.
  ingestionHeadlinesFetched,
}
