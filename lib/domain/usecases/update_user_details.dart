import 'package:keno_code_challenge/core/data_state.dart';
import 'package:keno_code_challenge/domain/models/user.dart';
import 'package:keno_code_challenge/domain/repositories/user_repository.dart';

class UpdateUserDetails {
  final UserRepository _userRepository;

  UpdateUserDetails(this._userRepository);

  Future<DataState<UserModel>> call(int numberOfMatches) {
    return _userRepository.updateUserData(numberOfMatches);
  }
}