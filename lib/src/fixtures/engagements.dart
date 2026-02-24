import 'dart:math';

import 'package:core/core.dart';

/// Generates a list of predefined engagements for fixture data.
///
/// This function can be configured to generate data in either English or
/// Arabic. It pairs reactions with comments to create realistic engagement
/// scenarios.
List<Engagement> getEngagementsFixturesData({
  String languageCode = 'en',
  DateTime? now,
}) {
  final engagements = <Engagement>[];
  final users = usersFixturesData;
  final headlines = getHeadlinesFixturesData();
  final reactions = reactionsFixturesData;
  final comments = getHeadlineCommentsFixturesData(
    languageCode: languageCode,
    now: now,
  );
  final referenceTime = now ?? DateTime.now();

  // We want to generate up to 100 engagements, or as many as we have IDs for.
  final maxEngagements = min(_engagementIds.length, 100);
  // We distribute these among the available users.
  final engagementsPerUser = (maxEngagements / users.length).ceil();

  for (var i = 0; i < users.length; i++) {
    for (var j = 0; j < engagementsPerUser; j++) {
      final index = i * engagementsPerUser + j;
      if (index >= maxEngagements) break;

      final user = users[i];
      final headline = headlines[index % headlines.length];
      final reaction = reactions[index % reactions.length];
      final comment = comments[index % comments.length];

      Reaction? engagementReaction;
      Comment? engagementComment;

      // Create varied engagement types for realistic test data.
      if (index % 3 == 0) {
        // Engagement with both reaction and comment
        engagementReaction = reaction;
        engagementComment = comment;
      } else if (index % 3 == 1) {
        // Engagement with only a reaction
        engagementReaction = reaction;
      } else {
        // Engagement with only a comment
        engagementComment = comment;
      }

      engagements.add(
        Engagement(
          id: _engagementIds[index],
          userId: user.id,
          entityId: headline.id,
          entityType: EngageableType.headline,
          reaction: engagementReaction,
          comment: engagementComment,
          createdAt: referenceTime.subtract(Duration(days: i, hours: j)),
          updatedAt: referenceTime.subtract(Duration(days: i, hours: j)),
        ),
      );
    }
  }

  return engagements;
}

const _engagementIds = [
  kEngagementId1,
  kEngagementId2,
  kEngagementId3,
  kEngagementId4,
  kEngagementId5,
  kEngagementId6,
  kEngagementId7,
  kEngagementId8,
  kEngagementId9,
  kEngagementId10,
  kEngagementId11,
  kEngagementId12,
  kEngagementId13,
  kEngagementId14,
  kEngagementId15,
  kEngagementId16,
  kEngagementId17,
  kEngagementId18,
  kEngagementId19,
  kEngagementId20,
  kEngagementId21,
  kEngagementId22,
  kEngagementId23,
  kEngagementId24,
  kEngagementId25,
  kEngagementId26,
  kEngagementId27,
  kEngagementId28,
  kEngagementId29,
  kEngagementId30,
  kEngagementId31,
  kEngagementId32,
  kEngagementId33,
  kEngagementId34,
  kEngagementId35,
  kEngagementId36,
  kEngagementId37,
  kEngagementId38,
  kEngagementId39,
  kEngagementId40,
  kEngagementId41,
  kEngagementId42,
  kEngagementId43,
  kEngagementId44,
  kEngagementId45,
  kEngagementId46,
  kEngagementId47,
  kEngagementId48,
  kEngagementId49,
  kEngagementId50,
  kEngagementId51,
  kEngagementId52,
  kEngagementId53,
  kEngagementId54,
  kEngagementId55,
  kEngagementId56,
  kEngagementId57,
  kEngagementId58,
  kEngagementId59,
  kEngagementId60,
  kEngagementId61,
  kEngagementId62,
  kEngagementId63,
  kEngagementId64,
  kEngagementId65,
  kEngagementId66,
  kEngagementId67,
  kEngagementId68,
  kEngagementId69,
  kEngagementId70,
  kEngagementId71,
  kEngagementId72,
  kEngagementId73,
  kEngagementId74,
  kEngagementId75,
  kEngagementId76,
  kEngagementId77,
  kEngagementId78,
  kEngagementId79,
  kEngagementId80,
  kEngagementId81,
  kEngagementId82,
  kEngagementId83,
  kEngagementId84,
  kEngagementId85,
  kEngagementId86,
  kEngagementId87,
  kEngagementId88,
  kEngagementId89,
  kEngagementId90,
  kEngagementId91,
  kEngagementId92,
  kEngagementId93,
  kEngagementId94,
  kEngagementId95,
  kEngagementId96,
  kEngagementId97,
  kEngagementId98,
  kEngagementId99,
  kEngagementId100,
];
