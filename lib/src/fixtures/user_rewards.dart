import 'package:core/src/enums/reward_type.dart';
import 'package:core/src/fixtures/fixture_ids.dart';
import 'package:core/src/models/rewards/user_rewards.dart';

/// A list of initial user rewards data to be loaded into the in-memory repository.
final List<UserRewards> userRewardsFixturesData = [
  // Rewarded User: Has active Ad-Free reward
  UserRewards(
    id: 'rew_001',
    userId: kRewardedUserId,
    activeRewards: {
      RewardType.adFree: DateTime.now().add(const Duration(days: 1)),
    },
  ),

  // Expired Reward User: Has expired Ad-Free reward
  UserRewards(
    id: 'rew_002',
    userId: kExpiredRewardUserId,
    activeRewards: {
      RewardType.adFree: DateTime.now().subtract(const Duration(hours: 1)),
    },
  ),

  // Standard User: No rewards
  const UserRewards(id: 'rew_003', userId: kStandardUserId, activeRewards: {}),
];
