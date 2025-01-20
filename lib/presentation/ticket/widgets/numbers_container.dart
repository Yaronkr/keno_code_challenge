import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keno_code_challenge/core/theme.dart';
import 'package:keno_code_challenge/core/utils/game_helper.dart';

class NumbersContainer extends StatelessWidget {
  const NumbersContainer({
    super.key,
    required this.numberBoxWidth,
    required this.numbers,
  });

  final double numberBoxWidth;
  final List<int> numbers;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, 
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: numberBoxWidth / 42, 
          ),
          itemCount: numbers.length, 
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            int number = numbers[index];
            Color backgroundColor = GameHelper.getRandomColor();
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                number.toString(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            );
          },
        ));
  }
}
