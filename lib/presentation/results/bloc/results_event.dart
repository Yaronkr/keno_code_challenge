part of 'results_bloc.dart';

abstract class ResultsEvent {}

class DrawStarted extends ResultsEvent {
  final List<int> userNumbers;
  DrawStarted({required this.userNumbers});
}

class NextNumber extends ResultsEvent {}

class DrawEnded extends ResultsEvent {}
