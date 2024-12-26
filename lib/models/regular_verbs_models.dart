class RegularVerbsModel {
  final int id;
  final String type; // 'regular' or 'irregular'
  final Map<String, String>
      english; // Contains present, past, and past participle
  final String spanish; // Spanish translation
  final Map<String, String>
      example; // Contains present, past, and past participle examples

  RegularVerbsModel({
    required this.id,
    required this.type,
    required this.english,
    required this.spanish,
    required this.example,
  });

  // Factory method to create a RegularVerbsModel from JSON
  factory RegularVerbsModel.fromJson(Map<String, dynamic> json) {
    return RegularVerbsModel(
      id: json['id'] ??
          0, // Assuming 0 as a default ID might not be ideal, adjust as necessary
      type:
          json['type'] as String? ?? 'regular', // Default to 'regular' if null
      english: json['english'] != null
          ? {
              'present':
                  json['english']['present'] as String? ?? 'defaultPresent',
              'past': json['english']['past'] as String? ?? 'defaultPast',
              'past_participle':
                  json['english']['past_participle'] as String? ??
                      'defaultPastParticiple',
            }
          : {
              'present': 'defaultPresent',
              'past': 'defaultPast',
              'past_participle': 'defaultPastParticiple'
            },
      spanish: json['spanish'] as String? ?? 'defaultSpanish',
      example: json['example'] != null
          ? {
              'present': json['example']['present'] as String? ??
                  'defaultExamplePresent',
              'past':
                  json['example']['past'] as String? ?? 'defaultExamplePast',
              'past_participle':
                  json['example']['past_participle'] as String? ??
                      'defaultExamplePastParticiple',
            }
          : {
              'present': 'defaultExamplePresent',
              'past': 'defaultExamplePast',
              'past_participle': 'defaultExamplePastParticiple'
            },
    );
  }

  // Method to convert RegularVerbsModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'english': english,
      'spanish': spanish,
      'examples': example,
    };
  }

  @override
  String toString() {
    return 'RegularVerbsModel{id: $id, type: $type, english: $english, spanish: $spanish, examples: $example}';
  }
}
