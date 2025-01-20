import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keno_code_challenge/presentation/results/bloc/results_bloc.dart';

class UserNumbersContainer extends StatelessWidget {
  const UserNumbersContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final resultsBloc = context.read<ResultsBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Numbers',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          itemCount: resultsBloc.userNumbers.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            int number = resultsBloc.userNumbers[index];
            bool isMatch = resultsBloc.isMatch(number);
            Color numberColor = isMatch ? Colors.red : Colors.black;

            return Center(
              child: Text(
                number.toString(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, color: numberColor),
              ),
            );
          },
        ),
      ],
    );
  }
}
