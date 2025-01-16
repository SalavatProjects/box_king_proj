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
  ];

  static const Map<String, Map<String, List<String>>> trainsContent = {
    'boxing' : {
      'Cardio (endurance)' : [
        'Interval training (mixing high-intensity work with rest periods): sprints, jumping rope, sprints.',
        'Rocket training on dummies or with shadows: arm and leg work techniques at a high tempo.',
        'Circuit training with an emphasis on cardio: various exercises (jumps, push-ups, sprints, etc.) with short rest intervals.',
        ],
      'Strenght Training' : [
        'Weightlifting builds the explosive power needed for stronger punches in boxing.',
        'Resistance band training strengthens arm and shoulder muscles for impactful strikes.',
        'Core workouts like planks are essential for balance and punch stability in boxing.',
      ]
    },
    'judo': {
      'Cardio (endurance)': [
        'Judo randori sessions develop cardiovascular endurance and dynamic movement control.',
        'Circuit training with judo throws enhances stamina for high-paced bouts on the mat.',
        'Continuous uchikomi practice is perfect for improving cardio and attack rhythm.',
      ],
      'Strenght Training': [
        'Deadlifts are key for building the grip strength essential in judo throws and holds.',
        'Pull-ups develop upper body power and grip control for effective judo techniques.',
        'Weighted squats improve the explosive power needed for dominant judo throws.',
      ],
    },
    'freestyle wrestling': {
      'Cardio (endurance)': [
        'Intense wrestling drills sharpen stamina and improve recovery time during matches.',
        'Sprint intervals mimic the short bursts of energy needed for wrestling takedowns.',
        'Wrestling-focused circuit training builds endurance for long, grueling bouts.',
      ],
      'Strenght Training': [
        'Power cleans increase full-body strength for powerful lifts and takedowns.',
        'Grip-strength exercises like farmer’s carries aid in controlling your opponent.',
        'Weighted lunges enhance leg power, boosting your wrestling performance.',
      ],
    },
    'mental training': {
      'Cardio (endurance)': [
        'Mental endurance grows through mindfulness exercises that sustain focus under pressure.',
        'Visualization techniques help athletes maintain clarity and resilience over time.',
        'Breathing drills improve mental stamina and support calm focus in high-stakes moments.',
      ],
      'Strenght Training': [
        'Regular meditation strengthens mental discipline and control under stressful scenarios.',
        'Affirmations develop a powerful mindset, fostering resilience and inner strength.',
        'Goal-setting practices sharpen mental focus and encourage consistent progress.',
      ],
    },
    'recovery training': {
      'Cardio (endurance)': [
        'Light swimming sessions boost cardiovascular health while aiding active recovery.',
        'Walking or cycling at a moderate pace improves endurance without overtraining.',
        'Recovery-based cardio reduces fatigue and accelerates the healing process.',
      ],
      'Strenght Training': [
        'Low-intensity resistance exercises support muscle recovery and rebuild strength.',
        'Stretching with resistance bands aids flexibility and strengthens recovering muscles.',
        'Bodyweight exercises like bridges gently enhance recovery and core stability.',
      ],
    },
  };
}