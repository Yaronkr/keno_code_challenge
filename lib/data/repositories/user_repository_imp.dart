import 'package:keno_code_challenge/core/config/constants.dart';
import 'package:keno_code_challenge/core/data_state.dart';
import 'package:keno_code_challenge/data/services/shared_preferences_service.dart';
import 'package:keno_code_challenge/domain/models/user.dart';
import 'package:keno_code_challenge/domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final SharedPreferencesService sharedPreferencesService;

  UserRepositoryImp(this.sharedPreferencesService);

  @override
  Future<DataState<UserModel>> getUserData() async {
    try {
      int totalMoney = await sharedPreferencesService.getInt('totalMoney') ?? kInitialUserMoney;
      int numberOfDraws = await sharedPreferencesService.getInt('numberOfDraws') ?? 0;
      UserModel user = UserModel(numberOfDraws: numberOfDraws, totalMoney: totalMoney);
      return DataSuccess(user);
    } catch (e) {
      return DataFailure(e.toString());
    }
  }

  @override
  Future<DataState<UserModel>> updateUserData(int numberOfMatched) async {
    try {
      int totalMoney = await sharedPreferencesService.getInt('totalMoney') ?? kInitialUserMoney;
      int numberOfDraws = await sharedPreferencesService.getInt('numberOfDraws') ?? 0;

      totalMoney += numberOfMatched;
      numberOfDraws++;

      await sharedPreferencesService.saveInt('totalMoney', totalMoney);
      await sharedPreferencesService.saveInt('numberOfDraws', numberOfDraws);

      UserModel updatedUser = UserModel(totalMoney: totalMoney, numberOfDraws: numberOfDraws);
      return DataSuccess(updatedUser);
    } catch (e) {
      return DataFailure(e.toString());
    }
  }
}
