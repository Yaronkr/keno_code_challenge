part of 'home_page_bloc.dart';

abstract class HomePageEvent {}

class LoadUserData extends HomePageEvent {}

class UpdateUserData extends HomePageEvent {
  final int matchedNumbers;
  UpdateUserData({required this.matchedNumbers});
}
