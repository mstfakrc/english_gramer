class AdvicesModels {
  final int id;
  final String tip;
  final String detail;

  AdvicesModels({required this.id, required this.tip, required this.detail});

  factory AdvicesModels.fromJson(Map<String, dynamic> json) {
    return AdvicesModels(
      id: json['id'] ?? 0,
      tip: json['tip'] ?? '',
      detail: json['detail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tip': tip,
      'detail': detail,
    };
  }

  @override
  String toString() {
    return 'AdvicesModels{id: $id, tip: $tip, detail: $detail}';
  }
}
