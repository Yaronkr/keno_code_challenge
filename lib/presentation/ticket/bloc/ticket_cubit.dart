import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keno_code_challenge/core/utils/game_helper.dart';

class TicketCubit extends Cubit<List<int>> {
  TicketCubit() : super(getNumbers());

  static List<int> getNumbers() {
    List<int> numbers = List.generate(10, (index) => GameHelper.getRandomNumber());
    numbers.sort();
    return numbers;
  }

  void shuffleNumbers() => emit(getNumbers());
}
