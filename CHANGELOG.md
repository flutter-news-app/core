# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog,
and this project adheres to Semantic Versioning.

## [Unreleased]

### Added
- **feat(models)**: Introduced the `Person` entity to represent individuals
  mentioned in news content.
- **feat(analytics)**: Added dashboard KPI and Chart identifiers for the new
  `Person` entity.
- **feat(enums)**: Added `ContentType.person`, `LimitedAction.followPerson`,
  `MediaAssetEntityType.person`, and `MediaAssetPurpose.personPhoto`.

### Changed
- **BREAKING refactor(models)**: Refactored `Headline` to replace singular
  `eventCountry` with plural `mentionedCountries` and `mentionedPersons`.
- **BREAKING refactor(models)**: Updated `HeadlineFilterCriteria` to require
  the `persons` list for strict content filtering.
- **refactor(models)**: Updated `UserContentPreferences` to include
  `followedPersons` for granular user interest tracking.
- **refactor(analytics)**: Added dashboard KPI and Chart identifiers to track
  absolute entity volume and visibility (e.g., `contentPersonsTotalMentions`).
- **refactor(feed)**: Updated `FeedItem` polymorphic serialization to support
  `Person` and `ContentCollectionItem<Person>`.

## [2.1.0] - 2026-03-1

### Added
- **feat(ingestion)**: Introduced `NewsAutomationTask` and associated enums (`FetchInterval`, `IngestionStatus`) to support automated news fetching. This infrastructure decouples the dashboard's intent from the API's provider implementation.
- **feat(analytics)**: Added ingestion-specific identifiers to `KpiCardId` and `ChartCardId` to support database-driven operational metrics for the dashboard.

## [2.0.0] - 2026-03-1

### Added
- **feat(i18n)**: Introduced `SupportedLanguage` enum to define the system's linguistic capabilities and `LocalizationConfig` to control the active language policy per deployment.
- **feat(config)**: Added `LocalizationConfig` to `AppConfig`, allowing remote management of `enabledLanguages` and the `defaultLanguage` fallback.
- **BREAKING chore(project)**: Consolidated core functionalities into a unified package structure. This refactoring introduces new `clients`, `repositories`, and `services` layers, requiring updates to dependency injection and usage across all consumer packages.

### Changed
- **BREAKING refactor(models)**: Implemented the Multilingual Content Strategy across the entire data layer. All user-facing string properties (e.g., `title`, `name`, `description`, `label`) in core models (`Headline`, `Topic`, `Source`, `Country`, `CallToActionItem`, `ContentCollectionItem`, `SavedHeadlineFilter`, `RankedListItem`, `KpiCardData`, `ChartCardData`, `PushNotificationPayload`) have been converted from `String` to `Map<SupportedLanguage, String>`. This allows the database to store all translations while the API projects a single language to the client.
- **refactor(models)**: Updated the `Comment` model to include a `language` field, ensuring user-generated content is tagged with its locale.
- **refactor(settings)**: Updated `AppSettings` to include a `language` preference typed as `SupportedLanguage`, allowing users to explicitly select their preferred content language.

## [1.10.0] - 2026-02-24

### Added
- **feat(ads)**: Added `appLovin` & `ironSource`  to `AdPlatformType` enum to support AppLovin (MAX) ad provider.

### Removed
- **BREAKING feat(filters)**: Removed the "Source Feed" feature. This includes the deletion of the `SavedSourceFilter` and `SourceFilterCriteria` models, along with their associated fixtures and tests.
- **BREAKING feat(notifications)**: Deprecated and removed the "Weekly Roundup" (`dailyDigest`) notification feature. This involved removing the `dailyDigest` value from `PushNotificationSubscriptionDeliveryType` and `RewardType` enums.
- **BREAKING feat(analytics)**: Removed analytics events related to source filters: `sourceFilterCreated`, `sourceFilterUpdated`, and `sourceFilterUsed`.

### Changed
- **refactor(models)**: Refactored `UserContentPreferences` and `UserLimitsConfig` to remove properties related to the deprecated source filters (`savedSourceFilters`).
- **refactor(tests)**: Cleaned up all associated test files to remove references to deprecated models and enums, ensuring all tests pass.


## [1.9.0] - 2026-02-21

### Added
- **feat(media)**: Introduced a comprehensive, platform-agnostic media upload system. This includes a `MediaRepository` and `MediaClient` to handle two-stage signed URL uploads, operating on `Uint8List` for full compatibility with mobile and web.
- **feat(analytics)**: Added robust analytics for the media upload feature, including new events (`mediaUploadStarted`, `mediaUploadCompleted`, `mediaUploadFailed`) with detailed payloads, and new dashboard KPI and Chart IDs (`mediaTotalUploads`, `mediaUploadsOverTime`, etc.) for monitoring.

### Changed
- **BREAKING refactor(models)**: To support asynchronous media uploads, core models (`Headline`, `Source`, `Topic`, `User`) have been refactored. Image URL fields are now nullable, and a `mediaAssetId` field has been added to link entities to managed media assets. The `copyWith` methods now use a `ValueWrapper` to correctly handle explicit null assignments.

## [1.8.0] - 2026-02-14

### Added
- **feat(analytics)**: Added new analytics events and payloads for "App Tour" (`appTourStarted`, `appTourStepViewed`, `appTourCompleted`, `appTourSkipped`) and "Initial Personalization" (`initialPersonalizationStarted`, `initialPersonalizationStepViewed`, `initialPersonalizationCompleted`, `initialPersonalizationSkipped`) to track user onboarding funnels.
- **feat(dashboard)**: Added new `ChartCardId` enums for tracking "App Tour" and "Initial Personalization" funnels, enabling enhanced dashboard monitoring and analysis.
- **feat(config)**: Added `OnboardingConfig` to control new users pre/post auth personalization flow.
- **feat(analytics)**: Added `step_index` and `step_name` to `AnalyticsParameterKeys` to support multi-step event tracking.


## [1.7.0] - 2026-02-12

### Changed
- **BREAKING refactor(analytics)**: Refactored dashboard card models (`KpiCardData`, `ChartCardData`, `RankedListCardData`) to use a `String` `id` for the document `ObjectId` and a new `cardId` field for the logical enum identifier, ensuring compatibility with the generic data client architecture.
- **BREAKING refactor(config)**: Split `AdPlatformIdentifiers` into explicit `android` and `ios` fields (e.g., `androidNativeAdId`, `iosNativeAdId`) to support platform-specific ad units directly in configuration.
- **feat(analytics)**: Added comprehensive Rewards System analytics events (`rewardsHubViewed`, `rewardOfferClicked`, `rewardGranted`) and associated payloads to track the user journey from offer to fulfillment.
- **BREAKING refactor(auth)**: Removed `AccessTier.premium`. The system now uses a flattened `guest`/`standard` tier model.
- **BREAKING refactor(subscription)**: Removed the entire Subscription domain (`UserSubscription`, `SubscriptionConfig`, etc.) in favor of a new Reward System.
- **feat(rewards)**: Introduced Time-Based Reward System (`UserRewards`, `RewardsConfig`, `RewardType`) allowing users to unlock features by watching ads.
- **refactor(config)**: Flattened `UserLimitsConfig` to remove premium limits, upgrading standard users to maximum capacity.
- **BREAKING refactor(enums)**: standardize the naming conventions for various provider-related enums within the system. By changing singular enum names to their plural counterparts (e.g., AnalyticsProvider to AnalyticsProviders), it enhances code clarity and consistency. This change propagates throughout the codebase, affecting enum definitions, their usage in models, configurations, data fixtures, and associated test files, ensuring a more intuitive and maintainable structure.
- **BREAKING refactor(enums)**: remove demo enums from production code
- **refactor**(remote_configs): remove unused ad platform identifiers
- **fix(tests)**: remove demo enums from tests


## [1.6.0] - 2025-12-31

### Added
- **feat(subscription)**: Introduced a complete **Subscription & Monetization System**. This includes the `UserSubscription` and `PurchaseTransaction` models, `SubscriptionConfig` for remote management of plans (monthly/annual), and a suite of analytics payloads for tracking the subscription lifecycle (`SubscriptionStarted`, `SubscriptionRenewed`, etc.).
- **feat(subscription)**: Added `AccessTier` enum to strictly define user entitlement levels (`guest`, `standard`, `premium`), decoupling it from the user's identity or role.
- **feat(analytics)**: Added new analytics payloads for subscription events and access tier changes (`AccessTierChangedPayload`).
- **feat(auth)**: Added `UserContext` model to separate ephemeral UI state (like `feedDecoratorStatus` and `dismissedHints`) from the core `User` identity.
- **feat(auth)**: Added `DismissibleHintType` enum to categorize UI coach marks.
- **feat(analytics)**: Added dashboard KPIs and charts for subscription management, including active subscriber trends, status distribution, and store provider breakdown.

### Changed
- **BREAKING refactor(auth)**: Refactored the `User` model to use `AccessTier` for entitlements and `UserRole` for administrative permissions. This replaces the overloaded `AppUserRole` enum.
- **BREAKING refactor(config)**: Updated `UserLimitsConfig`, `AdConfig`, and `FeedDecoratorConfig` to use `AccessTier` as the key for role-based configuration maps, replacing `AppUserRole`.
- **refactor(subscription)**: Replaced the dynamic `SubscriptionPlan` list in `SubscriptionConfig` with explicit `monthlyPlan` and `annualPlan` configurations for better type safety and client handling.
- **refactor(auth)**: Moved `feedDecoratorStatus` from the `User` model to the new `UserContext` model to cleanly separate identity from interaction state.
- **refactor(analytics)**: Replaced the `usersRoleDistribution` chart with `usersTierDistribution` to align dashboard analytics with the new `AccessTier` monetization model.

### Fixed
- **fix(config)**: Added missing `subscription` field to `FeaturesConfig` equality props.

## [1.5.0] - 2025-12-21

### Added
- **feat(config)**: Added `InitialPersonalizationConfig` to `AppConfig`.
- **feat(analytics)**: Established a robust and extensible analytics event tracking system. It standardizes event definitions and their associated data through type-safe enums and payload models, ensuring consistency and reducing errors. The changes also introduce a new, modular approach to dashboard data representation, moving away from a single summary model to dedicated models for charts, KPIs, and ranked lists, all configurable via remote settings.

### Changed
- **refactor(config)**: Extended the `RemoteConfig` and `FeaturesConfig` models to allow remote configuration of analytics, including enabling/disabling, active provider selection, and event sampling. Additionally, a new `DateTimeConverter` is introduced and applied across various models (`RemoteConfig`, `Country`, `Headline`, `Language`, `Source`, `Topic`, `InAppNotification`, `PushNotificationDevice`, `AppReview`, `Engagement`, `Report`) to standardize date serialization, replacing the previous `json_helpers.dart` utility.




## [1.4.0] - 2025-12-13

### Added
- **feat**: Added a comprehensive **Community & Engagement System**. This major feature introduces the foundational data models, fixtures and tests for user reactions, comments, a multi-entity reporting system, and a smart app review funnel. The entire system is remotely configurable via a new unified `CommunityConfig` model and extends `UserLimitsConfig` to support role-based limits for comments and reports.
- **feat**: Introduced data models to support a filter-based push notification system. This includes `SavedHeadlineFilter`, `SavedSourceFilter`, and related configuration models, providing the architectural foundation for clients to implement notification subscriptions.

### Changed
- **BREAKING refactor**: Overhauled data models and configuration to align with the new identity pivot toward news aggregator. This major refactor introduces a more scalable remote configuration structure, standardizes enums and models for broader use (e.g., `FeedItem` settings), and simplifies ad, notification, and headline data structures for improved clarity and maintainability.
- **BREAKING refactor**: Reworked `UserPreferenceConfig` to support the new notification system with a more scalable, role-based map structure for all user limits.

### Fixed
- **test**: Added comprehensive unit tests for all new and refactored models.

## [1.3.1] - 2025-10-24

### Fixed
- **chore**: Fixed the url of the source fixtures.

## [1.3.0] - 2025-10-24

### Added
- **BREAKING feat**: Added required `logoUrl` property to `Source` model.
- **chore**: Added more fixtures.

### Changed
- **test**: Updated `Source` model tests to reflect the new `logoUrl` property.

## [1.2.1] - 2025-10-15

### Fixed
- **fix**: Populated `followedCountries` in user preferences fixture.
- **fix**: Aligned `user_content_preferences_test` with fixture data.

### Changed
- **chore**: Used dynamic image URLs for headline fixtures.
- **chore**: Refactored tests to use fixtures directly instead of manual setup.

## [1.2.0] - 2025-10-12

### Added
- **feat**: Added SavedFilter model for storing user-defined filter combinations.
- **test**: Added unit tests for SavedFilter model.
- **docs**: Updated README to reflect new User Presets section and model.
- **chore**: Added fixture data for SavedFilter.

### Changed
- **BREAKING feat**: Linked SavedFilter to UserContentPreferences, making `savedFilters` a required field.
- **BREAKING feat**: Added limits for saved filters to UserPreferenceConfig.
- **BREAKING refactor**: Organized saved models into a new `user_presets` directory.
- **test**: Updated tests for UserContentPreferences to include saved filters.
- **chore**: Synchronized all related fixtures with recent model updates.
