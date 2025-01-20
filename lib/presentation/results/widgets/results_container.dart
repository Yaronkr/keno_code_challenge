import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keno_code_challenge/presentation/results/bloc/results_bloc.dart';

class ResultsContainer extends StatelessWidget {
  const ResultsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final resultsBloc = context.read<ResultsBloc>();
    return Column(
      children: [
        Text('Results', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black)),
        const SizedBox(height: 8),
        Text(
          'You have ${resultsBloc.matchedNumbers} matches',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.black,
              ),
        ),
      ],
    );
  }
}
