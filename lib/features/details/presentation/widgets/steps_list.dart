import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/step_entity.dart';

class StepsList extends StatelessWidget {
  const StepsList({
    super.key,
    required this.steps,
  });

  final List<StepEntity> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: steps.map((step) => _StepTile(step: step)).toList(),
    );
  }
}

class _StepTile extends StatelessWidget {
  const _StepTile({
    required this.step,
  });

  final StepEntity step;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          padding: const EdgeInsets.all(4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            "Шаг ${step.number}",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            step.step,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              height: 1.2
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
