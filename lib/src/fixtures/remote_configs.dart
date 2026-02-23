import 'package:core/core.dart';

final remoteConfigsFixturesData = <RemoteConfig>[
  RemoteConfig(
    id: kRemoteConfigId,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    app: const AppConfig(
      maintenance: MaintenanceConfig(isUnderMaintenance: false),
      update: UpdateConfig(
        latestAppVersion: '1.1.0',
        isLatestVersionOnly: false,
        iosUpdateUrl: 'https://apps.apple.com/app/example/id1234567890',
        androidUpdateUrl:
            'https://play.google.com/store/apps/details?id=com.example.app',
      ),
      general: GeneralAppConfig(
        termsOfServiceUrl: 'https://example.com/terms',
        privacyPolicyUrl: 'https://example.com/privacy',
      ),
    ),
    user: const UserConfig(
      limits: UserLimitsConfig(
        followedItems: {AccessTier.guest: 5, AccessTier.standard: 30},
        savedHeadlines: {AccessTier.guest: 10, AccessTier.standard: 100},
        savedHeadlineFilters: {
          AccessTier.guest: SavedFilterLimits(
            total: 3,
            pinned: 3,
            notificationSubscriptions: {
              PushNotificationSubscriptionDeliveryType.breakingOnly: 1,
            },
          ),
          AccessTier.standard: SavedFilterLimits(
            total: 25,
            pinned: 10,
            notificationSubscriptions: {
              PushNotificationSubscriptionDeliveryType.breakingOnly: 10,
            },
          ),
        },

        reactionsPerDay: {AccessTier.guest: 20, AccessTier.standard: 500},
        commentsPerDay: {AccessTier.guest: 0, AccessTier.standard: 50},
        reportsPerDay: {AccessTier.guest: 1, AccessTier.standard: 20},
      ),
    ),
    features: const FeaturesConfig(
      onboarding: OnboardingConfig(
        isEnabled: true,
        appTour: AppTourConfig(isEnabled: true, isSkippable: false),
        initialPersonalization: InitialPersonalizationConfig(
          isEnabled: true,
          isSkippable: true,
          isCountrySelectionEnabled: true,
          isTopicSelectionEnabled: true,
          isSourceSelectionEnabled: true,
        ),
      ),
      rewards: RewardsConfig(
        enabled: true,
        rewards: {
          RewardType.adFree: RewardDetails(enabled: true, durationDays: 1),
        },
      ),
      analytics: AnalyticsConfig(
        enabled: true,
        activeProvider: AnalyticsProviders.firebase,

        /// If an event is absent from this set, it is considered enabled by default
        disabledEvents: {AnalyticsEvent.contentReadingTime},
        // If an event is absent from this map, it is logged at a 1.0 rate (100%).
        eventSamplingRates: {AnalyticsEvent.contentViewed: 0.5},
      ),
      ads: AdConfig(
        enabled: true,
        primaryAdPlatform: AdPlatformType.admob,
        platformAdIdentifiers: {
          AdPlatformType.admob: AdPlatformIdentifiers(
            androidNativeAdId: 'ca-app-pub-3940256099942544/2247696110',
            androidBannerAdId: 'ca-app-pub-3940256099942544/6300978111',
            androidInterstitialAdId: 'ca-app-pub-3940256099942544/1033173712',
            androidRewardedAdId: 'ca-app-pub-3940256099942544/5224354917',
            iosNativeAdId: 'ca-app-pub-3940256099942544/3986624511',
            iosBannerAdId: 'ca-app-pub-3940256099942544/2934735716',
            iosInterstitialAdId: 'ca-app-pub-3940256099942544/4411468910',
            iosRewardedAdId: 'ca-app-pub-3940256099942544/1712485313',
          ),
        },
        feedAdConfiguration: FeedAdConfiguration(
          enabled: true,
          adType: AdType.native,
          visibleTo: {
            AccessTier.guest: FeedAdFrequencyConfig(
              adFrequency: 5,
              adPlacementInterval: 3,
            ),
            AccessTier.standard: FeedAdFrequencyConfig(
              adFrequency: 10,
              adPlacementInterval: 5,
            ),
          },
        ),
        navigationAdConfiguration: NavigationAdConfiguration(
          enabled: true,
          visibleTo: {
            AccessTier.guest: NavigationAdFrequencyConfig(
              internalNavigationsBeforeShowingInterstitialAd: 5,
              externalNavigationsBeforeShowingInterstitialAd: 5,
            ),
            AccessTier.standard: NavigationAdFrequencyConfig(
              internalNavigationsBeforeShowingInterstitialAd: 8,
              externalNavigationsBeforeShowingInterstitialAd: 8,
            ),
          },
        ),
      ),
      feed: FeedConfig(
        itemClickBehavior: FeedItemClickBehavior.internalNavigation,
        decorators: {
          FeedDecoratorType.linkAccount: FeedDecoratorConfig(
            category: FeedDecoratorCategory.callToAction,
            enabled: true,
            visibleTo: {
              AccessTier.guest: FeedDecoratorRoleConfig(daysBetweenViews: 3),
            },
          ),
          FeedDecoratorType.unlockRewards: FeedDecoratorConfig(
            category: FeedDecoratorCategory.callToAction,
            enabled: false,
            visibleTo: {
              AccessTier.standard: FeedDecoratorRoleConfig(daysBetweenViews: 7),
            },
          ),
          FeedDecoratorType.rateApp: FeedDecoratorConfig(
            category: FeedDecoratorCategory.callToAction,
            enabled: true,
            visibleTo: {
              AccessTier.guest: FeedDecoratorRoleConfig(daysBetweenViews: 14),
              AccessTier.standard: FeedDecoratorRoleConfig(
                daysBetweenViews: 30,
              ),
            },
          ),

          FeedDecoratorType.suggestedTopics: FeedDecoratorConfig(
            category: FeedDecoratorCategory.contentCollection,
            enabled: true,
            itemsToDisplay: 5,
            visibleTo: {
              AccessTier.guest: FeedDecoratorRoleConfig(daysBetweenViews: 7),
              AccessTier.standard: FeedDecoratorRoleConfig(
                daysBetweenViews: 14,
              ),
            },
          ),
          FeedDecoratorType.suggestedSources: FeedDecoratorConfig(
            category: FeedDecoratorCategory.contentCollection,
            enabled: true,
            itemsToDisplay: 5,
            visibleTo: {
              AccessTier.guest: FeedDecoratorRoleConfig(daysBetweenViews: 7),
              AccessTier.standard: FeedDecoratorRoleConfig(
                daysBetweenViews: 14,
              ),
            },
          ),
        },
      ),
      pushNotifications: PushNotificationConfig(
        enabled: true,
        primaryProvider: PushNotificationProviders.firebase,
        deliveryConfigs: {
          PushNotificationSubscriptionDeliveryType.breakingOnly: true,
        },
      ),
      community: CommunityConfig(
        enabled: true,
        engagement: EngagementConfig(
          enabled: true,
          engagementMode: EngagementMode.reactionsAndComments,
        ),
        reporting: ReportingConfig(
          enabled: true,
          headlineReportingEnabled: true,
          sourceReportingEnabled: true,
          commentReportingEnabled: true,
        ),
        appReview: AppReviewConfig(
          enabled: true,
          interactionCycleThreshold: 5,
          eligiblePositiveInteractions: [
            PositiveInteractionType.saveItem,
            PositiveInteractionType.followItem,
            PositiveInteractionType.shareContent,
            PositiveInteractionType.saveFilter,
          ],
          initialPromptCooldownDays: 3,
          isPositiveFeedbackFollowUpEnabled: true,
          isNegativeFeedbackFollowUpEnabled: true,
        ),
      ),
    ),
  ),
];
