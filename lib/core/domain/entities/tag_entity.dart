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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          emoji == other.emoji;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ emoji.hashCode;
}