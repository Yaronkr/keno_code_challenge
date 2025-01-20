import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keno_code_challenge/core/config/constants.dart';
import 'package:keno_code_challenge/core/utils/game_helper.dart';
import 'package:keno_code_challenge/injection_container.dart';
import 'package:keno_code_challenge/presentation/home/bloc/home_page_bloc.dart';

part 'results_event.dart';
part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  final List<int> _userNumbers = [];
  List<int> get userNumbers => _userNumbers;
  int _drawnNumbersIndex = -1;
  int get drawnNumbersIndex => _drawnNumbersIndex;
  int _matchedNumbers = 0;
  int get matchedNumbers => _matchedNumbers;
  Timer? _timer;
  final List<int> _drawnNumbers = [];
  List<int> get drawnNumbers => _drawnNumbers;
  final List<Color> _numberColors = [];

  ResultsBloc() : super(LoadingState()) {
    on<DrawStarted>((event, emit) {
      _userNumbers
        ..clear
        ..addAll(event.userNumbers);
      createShuffledList();

      _matchedNumbers = 0;

      _timer = Timer.periodic(Duration(milliseconds: kDrawResultsTimerInterval), (timer) {
        if (_drawnNumbersIndex < 19) {
          add(NextNumber());
        } else {
          timer.cancel();
          add(DrawEnded());
        }
      });
      emit(DrawStartedState());
    });

    on<NextNumber>((event, emit) {
      _drawnNumbersIndex++;
      int newNumber = _drawnNumbers[_drawnNumbersIndex];

      if (_userNumbers.contains(newNumber)) {
        _matchedNumbers++;
      }

      emit(NextNumberState());
    });

    on<DrawEnded>((event, emit) {
      _timer?.cancel();
      emit(DrawEndedState());
      sl<HomePageBloc>().add(UpdateUserData(matchedNumbers: _matchedNumbers));
    });
  }

  String getCurrentNumber(int index) {
    return _drawnNumbers[index].toString();
  }

  Color getColorForIndex(int index) {
    return _numberColors[index];
  }

  createShuffledList() {
    _numberColors
      ..clear()
      ..addAll(
        List.generate(20, (index) => GameHelper.getRandomColor()),
      );
    _drawnNumbers
      ..clear()
      ..addAll(
        (List.generate(80, (index) => index + 1)..shuffle()).sublist(0, 20),
      )
      ..sort();
  }

  bool isMatch(int number) {
    return _drawnNumbersIndex >= 0 && _drawnNumbers.sublist(0, _drawnNumbersIndex + 1).contains(number);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
