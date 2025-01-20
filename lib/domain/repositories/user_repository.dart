import 'package:keno_code_challenge/core/data_state.dart';
import 'package:keno_code_challenge/domain/models/user.dart';

abstract class UserRepository {
  Future<DataState<UserModel>> getUserData();
  Future<DataState<UserModel>> updateUserData(int numberOfMatched);
}