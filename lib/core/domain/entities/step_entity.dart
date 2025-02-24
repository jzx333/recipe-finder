class StepEntity {
  final int number;
  final String step;

  const StepEntity({
    required this.number,
    required this.step,
  });

  @override
  String toString() {
    return 'StepEntity{id: $number, step: $step}';
  }
}