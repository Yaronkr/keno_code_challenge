import 'package:flutter_test/flutter_test.dart';
import 'package:keno_code_challenge/core/config/constants.dart';
import 'package:keno_code_challenge/core/data_state.dart';
import 'package:keno_code_challenge/domain/usecases/update_user_details.dart';
import 'package:mocktail/mocktail.dart';
import 'package:keno_code_challenge/domain/models/user.dart';
import 'package:keno_code_challenge/domain/usecases/get_user.dart';
import 'package:keno_code_challenge/presentation/home/bloc/home_page_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

class MockGetUserData extends Mock implements GetUserData {}

class MockUpdateUserData extends Mock implements UpdateUserDetails {}

void main() {
  blocTest<HomePageBloc, HomePageState>(
    'LoadUserData test',
    build: () {
      final mockGetUserData = MockGetUserData();
      final mockUpdateUserData = MockUpdateUserData();

      when(() => mockGetUserData.call()).thenAnswer(
        (_) async => DataSuccess(
          UserModel(totalMoney: kInitialUserMoney, numberOfDraws: 0),
        ),
      );

      return HomePageBloc(
        getUserData: mockGetUserData,
        updateUserDetails: mockUpdateUserData,
      );
    },
    act: (bloc) => bloc.add(LoadUserData()),
    expect: () => [
      isA<HomePageSuccess>()
          .having((s) => s.user.totalMoney, 'totalMoney', kInitialUserMoney)
          .having((s) => s.user.numberOfDraws, 'numberOfDraws', 0),
    ],
    verify: (bloc) {
      print('Test passed with state: ${bloc.state}');
    },
  );
}
