class VocabularyModels {
  final int id;
  final String word;
  final String spanish;
  final String example;

  VocabularyModels(
      {required this.id,
      required this.word,
      required this.spanish,
      required this.example});

  factory VocabularyModels.fromJson(Map<String, dynamic> json) {
    return VocabularyModels(
      id: json['id'] ?? 0,
      word: json['word'] ?? '',
      spanish: json['spanish'] ?? '',
      example: json['example'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'spanish': spanish,
      'example': example,
    };
  }

  @override
  String toString() {
    return 'VocabularyModels{id: $id, word: $word, spanish: $spanish, example: $example}';
  }
}
