import 'package:get_it/get_it.dart';
import 'package:keno_code_challenge/data/repositories/user_repository_imp.dart';
import 'package:keno_code_challenge/data/services/shared_preferences_service.dart';
import 'package:keno_code_challenge/domain/repositories/user_repository.dart';
import 'package:keno_code_challenge/domain/usecases/get_user.dart';
import 'package:keno_code_challenge/domain/usecases/update_user_details.dart';
import 'package:keno_code_challenge/presentation/home/bloc/home_page_bloc.dart';
import 'package:keno_code_challenge/presentation/results/bloc/results_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<SharedPreferencesService>(SharedPreferencesServiceImp());

  sl.registerSingleton<UserRepository>(UserRepositoryImp(sl()));
  sl.registerSingleton<GetUserData>(GetUserData(sl()));
  sl.registerSingleton<UpdateUserDetails>(UpdateUserDetails(sl()));
  sl.registerSingleton<HomePageBloc>(HomePageBloc(
    getUserData: sl<GetUserData>(),
    updateUserDetails: sl<UpdateUserDetails>(),
  ));

  sl.registerFactory(() => ResultsBloc());
}
