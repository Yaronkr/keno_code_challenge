part of 'results_bloc.dart';

abstract class ResultsState {}

class LoadingState extends ResultsState {}

class DrawStartedState extends ResultsState {}

class NextNumberState extends ResultsState {}

class DrawEndedState extends ResultsState {}
