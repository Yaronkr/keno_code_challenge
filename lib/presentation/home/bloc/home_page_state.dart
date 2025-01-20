part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageGetData extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageSuccess extends HomePageState {
  final UserModel user;
  HomePageSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}


class HomePageFailure extends HomePageState {
  final String error;
  HomePageFailure(this.error);
}
