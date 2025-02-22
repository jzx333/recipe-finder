class StepEntity {
  final int id;
  final String step;

  const StepEntity({
    required this.id,
    required this.step,
  });

  @override
  String toString() {
    return 'StepEntity{id: $id, step: $step}';
  }
}