class TagEntity {
  final int id;
  final String name;
  final String emoji;

  const TagEntity({
    required this.id,
    required this.name,
    required this.emoji,
  });

  @override
  String toString() {
    return 'TagEntity{id: $id, name: $name, emoji: $emoji}';
  }
}