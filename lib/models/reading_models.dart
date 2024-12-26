class ReadingModels {
  final int id;
  final String title;
  final String topic;
  final String story;

  ReadingModels({
    required this.id,
    required this.title,
    required this.topic,
    required this.story,
  });

  factory ReadingModels.fromJson(Map<String, dynamic> json) {
    return ReadingModels(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      topic: json['topic'] ?? '',
      story: json['story'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'topic': topic,
      'story': story,
    };
  }

  @override
  String toString() {
    return 'ReadingModels{id: $id, title: $title, topic: $topic, story: $story}';
  }
}
