import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keno_code_challenge/presentation/results/bloc/results_bloc.dart';

class DrawNumbersContainer extends StatelessWidget {
  const DrawNumbersContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final resultsBloc = context.read<ResultsBloc>();
    return Column(
      children: [
        Text(
          'Ball Draw',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 12),
        if (resultsBloc.drawnNumbers.isNotEmpty) ...{
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              bool isDrawn = index <= resultsBloc.drawnNumbersIndex;

              Color backgroundColor = isDrawn ? resultsBloc.getColorForIndex(index) : Colors.grey;
              String? displayNumber = isDrawn ? resultsBloc.getCurrentNumber(index) : null;

              return isDrawn
                  ? ZoomIn(
                      animate: isDrawn,
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: displayNumber != null
                            ? Text(
                                displayNumber,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              )
                            : null,
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: displayNumber != null
                          ? Text(
                              displayNumber,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            )
                          : null,
                    );
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        },
      ],
    );
  }
}
