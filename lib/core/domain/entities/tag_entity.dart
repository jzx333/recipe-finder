class TagEntity {
  final String name;
  final String emoji;

  const TagEntity({
    required this.name,
    required this.emoji,
  });

  @override
  String toString() {
    return 'TagEntity{name: $name, emoji: $emoji}';
  }
}