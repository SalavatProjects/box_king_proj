abstract class AppConstants {
  static const duration200 = Duration(milliseconds: 200);
  static const List<String> trainNames = [
    'boxing',
    'judo',
    'freestyle wrestling',
    'mental training',
    'recovery training',
  ];

  static const List<String> trainTypes = [
    'Cardio (endurance)',
    'Strenght Training',
    'Muscles',
  ];

  static const Map<String, List<String>> trainTypesContent = {
    'Cardio (endurance)' : [
      'Interval training (mixing high-intensity work with rest periods): sprints, jumping rope, sprints.',
      'Rocket training on dummies or with shadows: arm and leg work techniques at a high tempo.',
      'Circuit training with an emphasis on cardio: various exercises (jumps, push-ups, sprints, etc.) with short rest intervals.',
    ],
    'Strenght Training' : [
      'Playing sports builds teamwork, discipline, and improves physical health.',
      'A balanced diet and regular exercise are key to achieving peak athletic performance.',
      'Soccer is the world\'s most popular sport, loved by millions across the globe.',
      'Never underestimate the power of persistence in reaching your sports goals.',
    ],
    'Muscles' : [
      'Running is a simple yet effective way to boost cardiovascular health and endurance.',
      'Champions are made from hard work, dedication, and an unyielding passion for the game.',
    ]
  };
}