class StepEntity {
  final int step;
  final String text;

  const StepEntity({
    required this.step,
    required this.text,
  });

  @override
  String toString() {
    return 'StepEntity{id: $step, step: $text}';
  }
}