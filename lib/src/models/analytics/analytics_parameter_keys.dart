import 'package:core/core.dart';

/// {@template analytics_parameter_keys}
/// Defines a centralized, type-safe collection of parameter keys used in
/// analytics events.
///
/// Using constants for keys prevents typos and "magic strings", ensuring
/// consistency between the client-side event logging and backend data analysis.
/// {@endtemplate}
abstract final class AnalyticsParameterKeys {
  /// The method used for authentication (e.g., 'email', 'anonymous').
  ///
  /// Used in [UserRegisteredPayload] and [UserLoginPayload].
  static const String authMethod = 'authMethod';

  /// The unique identifier of a piece of content.
  ///
  /// Used in: [ContentViewedPayload], [ContentSharedPayload],
  /// [ContentSavedPayload], [ContentUnsavedPayload], [ReactionCreatedPayload],
  /// [ReactionDeletedPayload], [CommentCreatedPayload], [CommentDeletedPayload],
  /// [ContentReadingTimePayload].
  static const String contentId = 'contentId';

  /// The type of content (e.g., 'headline').
  ///
  /// Used in [ContentViewedPayload].
  static const String contentType = 'contentType';

  /// The type of a user's reaction (e.g., 'like', 'insightful').
  ///
  /// Used in: [ReactionCreatedPayload], [ReactionDeletedPayload].
  static const String reactionType = 'reactionType';

  /// The type of limit that was exceeded (e.g., 'savedHeadlines').
  ///
  /// Used in [LimitExceededPayload].
  static const String limitType = 'limitType';

  /// The call-to-action presented to the user (e.g., 'upgrade', 'linkAccount').
  ///
  /// Used in [LimitExceededCtaClickedPayload].
  static const String ctaType = 'ctaType';

  /// The duration of an event, in seconds (e.g., content reading time).
  ///
  /// Used in [ContentReadingTimePayload].
  static const String durationInSeconds = 'durationInSeconds';

  /// The user's chosen browser preference (e.g., 'inApp', 'external').
  ///
  /// Used in [BrowserChoiceChangedPayload].
  static const String browserType = 'browserType';

  /// The ad provider that served the ad (e.g., 'admob').
  ///
  /// Used in: [AdImpressionPayload], [AdClickedPayload], [AdLoadFailedPayload],
  /// [AdRewardEarnedPayload].
  static const String adProvider = 'adProvider';

  /// The format of the ad (e.g., 'native', 'banner').
  ///
  /// Used in: [AdImpressionPayload], [AdClickedPayload], [AdLoadFailedPayload],
  /// [AdRewardEarnedPayload].
  static const String adType = 'adType';

  /// The location in the app where the ad was shown (e.g., 'feed').
  ///
  /// Used in: [AdImpressionPayload], [AdClickedPayload], [AdRewardEarnedPayload].
  static const String adPlacement = 'adPlacement';

  /// The medium used for sharing content (e.g., 'whatsapp', 'twitter').
  ///
  /// Used in [ContentSharedPayload].
  static const String shareMedium = 'shareMedium';

  /// The text query entered by the user for a search.
  ///
  /// Used in [SearchPerformedPayload].
  static const String searchQuery = 'searchQuery';

  /// The number of results returned for a search.
  ///
  /// Used in [SearchPerformedPayload].
  static const String searchResultCount = 'searchResultCount';

  /// The user's previous role before a change.
  ///
  /// Used in [UserRoleChangedPayload].
  static const String fromRole = 'fromRole';

  /// The user's new role after a change.
  ///
  /// Used in [UserRoleChangedPayload].
  static const String toRole = 'toRole';

  /// The user's previous access tier before a change.
  ///
  /// Used in [AccessTierChangedPayload].
  static const String fromTier = 'fromTier';

  /// The user's new access tier after a change.
  ///
  /// Used in [AccessTierChangedPayload].
  static const String toTier = 'toTier';

  /// The user's response to a prompt (e.g., 'positive', 'negative').
  ///
  /// Used in [AppReviewPromptRespondedPayload].
  static const String feedback = 'feedback';

  /// The base theme name (e.g., 'light', 'dark').
  ///
  /// Used in [ThemeChangedPayload].
  static const String baseTheme = 'baseTheme';

  /// The accent theme name (e.g., 'newsRed').
  ///
  /// Used in [ThemeChangedPayload].
  static const String accentTheme = 'accentTheme';

  /// The language code (e.g., 'en', 'ar').
  ///
  /// Used in [LanguageChangedPayload].
  static const String languageCode = 'languageCode';

  /// The event that triggered the presentation of a paywall.
  ///
  /// Used in: [PaywallPresentedPayload].
  static const String triggerEvent = 'triggerEvent';

  /// The unique identifier of a subscription product.
  ///
  /// Used in: [SubscriptionStartedPayload], [SubscriptionRenewedPayload],
  /// [SubscriptionCancelledPayload], [SubscriptionEndedPayload].
  static const String productId = 'productId';

  /// The price of a subscription product.
  ///
  /// Used in: [SubscriptionStartedPayload].
  static const String price = 'price';

  /// The ISO 4217 currency code of a price.
  ///
  /// Used in: [SubscriptionStartedPayload].
  static const String currency = 'currency';

  /// The unique identifier of a filter.
  ///
  /// Used in: [HeadlineFilterCreatedPayload], [HeadlineFilterUpdatedPayload],
  /// [HeadlineFilterUsedPayload].
  static const String filterId = 'filterId';

  /// The error code from a failed operation.
  ///
  /// Used in: [AdLoadFailedPayload].
  static const String errorCode = 'errorCode';

  /// The reason for a failure event.
  ///
  /// Used in: [MediaUploadFailedPayload].
  static const String failureReason = 'failureReason';

  /// The amount of a reward earned.
  ///
  /// Used in: [AdRewardEarnedPayload].
  static const String rewardAmount = 'rewardAmount';

  /// The type of reward being interacted with (e.g., 'adFree', 'dailyDigest').
  ///
  /// Used in: [RewardOfferClickedPayload], [RewardGrantedPayload].
  static const String rewardType = 'rewardType';

  /// The density setting for a feed.
  ///
  /// Used in: [FeedDensityChangedPayload].
  static const String density = 'density';

  /// The reason for a subscription ending (e.g., 'billingError', 'userCancelled').
  ///
  /// Used in: [SubscriptionEndedPayload].
  static const String reason = 'reason';

  /// The intended use of an asset.
  ///
  /// Used in: [MediaUploadStartedPayload], [MediaUploadCompletedPayload], [MediaUploadFailedPayload].
  static const String purpose = 'purpose';

  /// The duration of the granted reward in days.
  ///
  /// Used in: [RewardGrantedPayload].
  static const String durationDays = 'durationDays';

  /// The UI element or event that triggered an action.
  ///
  /// Used in: [AccountLinkedPayload].
  static const String trigger = 'trigger';

  /// Indicates if the app review prompt was shown for the first time.
  ///
  /// Used in: [AppReviewPromptRespondedPayload].
  static const String isFirstPrompt = 'isFirstPrompt';

  /// The detailed text feedback provided by a user.
  ///
  /// Used in: [AppReviewPromptRespondedPayload].
  static const String feedbackDetails = 'feedbackDetails';

  /// A boolean indicating if a filter is pinned.
  ///
  /// Used in: [HeadlineFilterCreatedPayload], [HeadlineFilterUpdatedPayload],
  /// [HeadlineFilterCreatedPayload], [HeadlineFilterUpdatedPayload].
  static const String isPinned = 'isPinned';

  /// A list of notification delivery types for a filter.
  ///
  /// Used in: [HeadlineFilterCreatedPayload].
  static const String deliveryTypes = 'deliveryTypes';

  /// A summary of a filter's criteria.
  ///
  /// Used in: [HeadlineFilterCreatedPayload], [HeadlineFilterUpdatedPayload],
  /// [HeadlineFilterUsedPayload].
  static const String criteriaSummary = 'criteriaSummary';

  /// The index of a step in a multi-step flow (e.g., app tour).
  ///
  /// Used in: [AppTourStepViewedPayload].
  static const String stepIndex = 'step_index';

  /// The name of a step in a multi-step flow (e.g., initial personalization).
  ///
  /// Used in: [InitialPersonalizationStepViewedPayload].
  static const String stepName = 'step_name';

  /// The screen or feature from which the user navigated.
  ///
  /// Used in: [RewardsHubViewedPayload].
  static const String referrer = 'referrer';

  /// The name of an uploaded file.
  ///
  /// Used in: [MediaUploadStartedPayload], [MediaUploadCompletedPayload],
  /// [MediaUploadFailedPayload].
  static const String fileName = 'fileName';

  /// The size of an uploaded file in bytes.
  ///
  /// Used in: [MediaUploadStartedPayload], [MediaUploadCompletedPayload].
  static const String fileSize = 'fileSize';

  /// The unique ID of a successfully uploaded media asset.
  ///
  /// Used in: [MediaUploadCompletedPayload].
  static const String mediaAssetId = 'mediaAssetId';

  /// The duration of an upload in seconds.
  /// Used in: [MediaUploadCompletedPayload].
  static const String uploadDurationSeconds = 'uploadDurationSeconds';
}
