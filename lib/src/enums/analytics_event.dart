import 'package:core/src/models/analytics/payloads/payloads.dart';

/// {@template analytics_event}
/// A comprehensive, standardized vocabulary for all trackable user actions and
/// system events across the application.
///
/// Using an enum for event names ensures type safety and consistency between
/// client-side tracking and backend reporting, eliminating "magic strings".
/// {@endtemplate}
enum AnalyticsEvent {
  // --- Authentication & User Progression ---

  /// Triggered when the pre-authentication app tour is shown for the first time.
  /// Associated payload: [AppTourStartedPayload].
  appTourStarted,

  /// Triggered for each page view within the app tour.
  /// Associated payload: [AppTourStepViewedPayload].
  appTourStepViewed,

  /// Triggered when the user completes the app tour.
  /// Associated payload: [AppTourCompletedPayload].
  appTourCompleted,

  /// Triggered if the user skips the app tour.
  /// Associated payload: [AppTourSkippedPayload].
  appTourSkipped,

  /// Triggered when the post-authentication initial personalization flow begins.
  /// Associated payload: [InitialPersonalizationStartedPayload].
  initialPersonalizationStarted,

  /// Triggered for each step view within the initial personalization flow.
  /// Associated payload: [InitialPersonalizationStepViewedPayload].
  initialPersonalizationStepViewed,

  /// Triggered upon successful completion of the initial personalization flow.
  /// Associated payload: [InitialPersonalizationCompletedPayload].
  initialPersonalizationCompleted,

  /// Triggered if the user skips the initial personalization flow.
  /// Associated payload: [InitialPersonalizationSkippedPayload].
  initialPersonalizationSkipped,

  /// Triggered when a new user is successfully registered.
  /// Associated payload: [UserRegisteredPayload].
  userRegistered,

  /// Triggered when a user successfully logs in.
  /// Associated payload: [UserLoginPayload].
  userLogin,

  /// Triggered when an anonymous user links their account to a permanent one.
  /// Associated payload: [AccountLinkedPayload].
  accountLinked,

  /// Triggered when a user's role changes (e.g., standard to premium).
  /// Associated payload: [UserRoleChangedPayload].
  userRoleChanged,

  // --- Content Consumption ---

  /// Triggered when a user views a piece of content (e.g., a headline).
  /// Associated payload: [ContentViewedPayload].
  contentViewed,

  /// Triggered when a user shares a piece of content.
  /// Associated payload: [ContentSharedPayload].
  contentShared,

  /// Triggered when a user saves a piece of content.
  /// Associated payload: [ContentSavedPayload].
  contentSaved,

  /// Triggered when a user unsaves a piece of content.
  /// Associated payload: [ContentUnsavedPayload].
  contentUnsaved,

  /// Triggered when a user clicks a headline and is redirected. This event can
  /// be used as a proxy for tracking reading time by measuring the duration
  /// until the user returns to the app.
  /// Associated payload: [ContentReadingTimePayload].
  contentReadingTime,

  // --- User-Generated Content (UGC) ---

  /// Triggered when a user adds or changes a reaction to a piece of content.
  /// Associated payload: [ReactionCreatedPayload].
  reactionCreated,

  /// Triggered when a user removes a reaction from a piece of content.
  /// Associated payload: [ReactionDeletedPayload].
  reactionDeleted,

  /// Triggered when a user posts a comment.
  /// Associated payload: [CommentCreatedPayload].
  commentCreated,

  /// Triggered when a user deletes their own comment.
  /// Associated payload: [CommentDeletedPayload].
  commentDeleted,

  /// Triggered when a user submits a report for a piece of content.
  /// Associated payload: [ReportSubmittedPayload].
  reportSubmitted,

  // --- Feature Usage ---

  /// Triggered when a user creates a new headline filter.
  /// Associated payload: [HeadlineFilterCreatedPayload].
  headlineFilterCreated,

  /// Triggered when a user updates a headline filter.
  /// Associated payload: [HeadlineFilterUpdatedPayload].
  headlineFilterUpdated,

  /// Triggered when a user applies an existing headline filter.
  /// Associated payload: [HeadlineFilterUsedPayload].
  headlineFilterUsed,

  /// Triggered when a user performs a search.
  /// Associated payload: [SearchPerformedPayload].
  searchPerformed,

  /// Triggered when a user responds to the in-app review prompt.
  /// Associated payload: [AppReviewPromptRespondedPayload].
  appReviewPromptResponded,

  /// Triggered when the app requests the native store review dialog.
  /// No payload.
  appReviewStoreRequested,

  // --- Limits & Monetization CTAs ---

  /// Triggered when a user hits a feature limit defined in remote config.
  /// This event captures that the "limit exceeded" bottom sheet was shown.
  /// Associated payload: [LimitExceededPayload].
  limitExceeded,

  /// Triggered when a user clicks the call-to-action button on a
  /// "limit exceeded" bottom sheet (e.g., 'Upgrade', 'Link Account').
  /// Associated payload: [LimitExceededCtaClickedPayload].
  limitExceededCtaClicked,

  // --- Monetization & Paywall ---

  /// Triggered when a paywall is presented to the user.
  /// Associated payload: [PaywallPresentedPayload].
  paywallPresented,

  /// Triggered when a user starts a new subscription.
  /// Associated payload: [SubscriptionStartedPayload].
  subscriptionStarted,

  /// Triggered when a user's subscription is successfully renewed.
  /// Associated payload: [SubscriptionRenewedPayload].
  subscriptionRenewed,

  /// Triggered when a user cancels their subscription.
  /// Associated payload: [SubscriptionCancelledPayload].
  subscriptionCancelled,

  /// Triggered when a subscription ends (e.g., due to billing failure).
  /// Associated payload: [SubscriptionEndedPayload].
  subscriptionEnded,

  // --- Ads ---

  /// Triggered when an ad is shown to the user.
  /// Associated payload: [AdImpressionPayload].
  adImpression,

  /// Triggered when a user clicks on an ad.
  /// Associated payload: [AdClickedPayload].
  adClicked,

  /// Triggered when an ad fails to load.
  /// Associated payload: [AdLoadFailedPayload].
  adLoadFailed,

  // --- Media Uploads ---

  /// Triggered when a user initiates a file upload.
  /// Associated payload: [MediaUploadStartedPayload].
  mediaUploadStarted,

  /// Triggered when a file upload completes successfully.
  /// Associated payload: [MediaUploadCompletedPayload].
  mediaUploadCompleted,

  /// Triggered when a file upload fails.
  /// Associated payload: [MediaUploadFailedPayload].
  mediaUploadFailed,

  // --- Rewards System ---

  /// Triggered when the user views the Rewards Hub page.
  /// Associated payload: [RewardsHubViewedPayload].
  rewardsHubViewed,

  /// Triggered when a user clicks on a specific reward offer.
  /// Associated payload: [RewardOfferClickedPayload].
  rewardOfferClicked,

  /// Triggered when a user earns a reward from a rewarded ad.
  /// Associated payload: [AdRewardEarnedPayload].
  adRewardEarned,

  /// Triggered when a reward is successfully granted to the user (after validation).
  /// Associated payload: [RewardGrantedPayload].
  rewardGranted,

  // --- Settings & Preferences ---

  /// Triggered when the user changes the app theme.
  /// Associated payload: [ThemeChangedPayload].
  themeChanged,

  /// Triggered when the user changes the app language.
  /// Associated payload: [LanguageChangedPayload].
  languageChanged,

  /// Triggered when the user changes the feed density setting.
  /// Associated payload: [FeedDensityChangedPayload].
  feedDensityChanged,

  /// Triggered when the user changes their preferred browser behavior.
  /// Associated payload: [BrowserChoiceChangedPayload].
  browserChoiceChanged,
}
