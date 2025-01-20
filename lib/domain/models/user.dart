import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int totalMoney;
  final int numberOfDraws;

  const UserModel({required this.totalMoney, required this.numberOfDraws});

  @override
  List<Object?> get props => [totalMoney, numberOfDraws];
}
