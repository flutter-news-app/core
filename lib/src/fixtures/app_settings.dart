import 'package:core/core.dart';

/// App Settings Demo Data
final List<AppSettings> appSettingsFixturesData = [
  const AppSettings(
    id: kAdminUserId,
    displaySettings: DisplaySettings(
      baseTheme: AppBaseTheme.system,
      accentTheme: AppAccentTheme.defaultBlue,
      fontFamily: 'SystemDefault',
      textScaleFactor: AppTextScaleFactor.medium,
      fontWeight: AppFontWeight.regular,
    ),
    language: SupportedLanguage.en,
    feedSettings: FeedSettings(
      feedItemDensity: FeedItemDensity.standard,
      feedItemImageStyle: FeedItemImageStyle.smallThumbnail,
      feedItemClickBehavior: FeedItemClickBehavior.defaultBehavior,
    ),
  ),
  const AppSettings(
    id: kPublisherStandardId,
    displaySettings: DisplaySettings(
      baseTheme: AppBaseTheme.dark,
      accentTheme: AppAccentTheme.newsRed,
      fontFamily: 'SystemDefault',
      textScaleFactor: AppTextScaleFactor.medium,
      fontWeight: AppFontWeight.regular,
    ),
    language: SupportedLanguage.en,
    feedSettings: FeedSettings(
      feedItemDensity: FeedItemDensity.compact,
      feedItemImageStyle: FeedItemImageStyle.largeThumbnail,
      feedItemClickBehavior: FeedItemClickBehavior.defaultBehavior,
    ),
  ),
  // Add settings for users 3-10, copying the admin's settings for simplicity
  ...List.generate(
    8,
    (index) => AppSettings(
      id: [
        kUser3Id,
        kUser4Id,
        kUser5Id,
        kUser6Id,
        kUser7Id,
        kUser8Id,
        kUser9Id,
        kUser10Id,
      ][index],
      displaySettings: const DisplaySettings(
        baseTheme: AppBaseTheme.system,
        accentTheme: AppAccentTheme.defaultBlue,
        fontFamily: 'SystemDefault',
        textScaleFactor: AppTextScaleFactor.medium,
        fontWeight: AppFontWeight.regular,
      ),
      language: SupportedLanguage.en,
      feedSettings: const FeedSettings(
        feedItemDensity: FeedItemDensity.standard,
        feedItemImageStyle: FeedItemImageStyle.smallThumbnail,
        feedItemClickBehavior: FeedItemClickBehavior.defaultBehavior,
      ),
    ),
  ),
];
