class PhrasalVerbModels {
  final int id;
  final String phrasalVerb;
  final String spanish;
  final String example;

  PhrasalVerbModels({
    required this.id,
    required this.phrasalVerb,
    required this.spanish,
    required this.example,
  });

  factory PhrasalVerbModels.fromJson(Map<String, dynamic> json) {
    return PhrasalVerbModels(
      id: json['id'] ?? 0,
      phrasalVerb: json['phrasalVerb'] ?? '',
      spanish: json['spanish'] ?? '',
      example: json['example'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phrasalVerb': phrasalVerb,
      'spanish': spanish,
      'example': example,
    };
  }

  @override
  String toString() {
    return 'PhrasalVerbModels{id: $id, phrasalVerb: $phrasalVerb, spanish: $spanish, example: $example}';
  }
}