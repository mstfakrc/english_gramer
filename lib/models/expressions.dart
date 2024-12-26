class ExpressionsModels {
  final int id;
  final String expression;
  final String meaning;

  ExpressionsModels({required this.id, required this.expression, required this.meaning});

  factory ExpressionsModels.fromJson(Map<String, dynamic> json) {
    return ExpressionsModels(
      id: json['id'] ?? 0,
      expression: json['expression'] ?? '',
      meaning: json['meaning'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'expression': expression,
      'meaning': meaning,
    };
  }

  @override
  String toString() {
    return 'ExpressionsModels{id: $id, expression: $expression, meaning: $meaning}';
  }
}
