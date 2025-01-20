import 'package:keno_code_challenge/core/data_state.dart';
import 'package:keno_code_challenge/domain/models/user.dart';
import 'package:keno_code_challenge/domain/repositories/user_repository.dart';

class GetUserData {
  final UserRepository _userRepository;

  GetUserData(this._userRepository);

  Future<DataState<UserModel>> call() {
    return _userRepository.getUserData();
  }
}
