import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keno_code_challenge/core/data_state.dart';
import 'package:keno_code_challenge/domain/models/user.dart';
import 'package:keno_code_challenge/domain/usecases/get_user.dart';
import 'package:keno_code_challenge/domain/usecases/update_user_details.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetUserData getUserData;
  final UpdateUserDetails updateUserDetails;



  HomePageBloc({required this.getUserData, required this.updateUserDetails}) : super(HomePageLoading()) {
    on<LoadUserData>((event, emit) async {
      try {
        DataState<UserModel> data = await getUserData.call();
   
        if (data is DataSuccess && data.data != null) {
          emit(HomePageSuccess(user: data.data!));
        } else if (data is DataFailure) {
          emit(HomePageFailure('Something Went Wrong Please Reload App'));
        }
      } catch (e) {
        emit(HomePageFailure('Something Went Wrong Please Reload App'));
      }
    });
    on<UpdateUserData>((event, emit) async {
      emit(HomePageLoading());
      try {
        DataState<UserModel> data = await updateUserDetails.call(event.matchedNumbers);
      
        if (data is DataSuccess && data.data != null) {
          emit(HomePageSuccess(user: data.data!));
        } else if (data is DataFailure) {
          emit(HomePageFailure('Something Went Wrong Please Reload App'));
        }
      } catch (e) {
        emit(HomePageFailure('Something Went Wrong Please Reload App'));
      }
    });
  }
}
