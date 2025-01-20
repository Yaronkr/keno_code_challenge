import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keno_code_challenge/core/config/assets.dart';
import 'package:keno_code_challenge/core/shared_ui/refresh_widget.dart';
import 'package:keno_code_challenge/core/shared_ui/str_button.dart';
import 'package:keno_code_challenge/core/theme.dart';
import 'package:keno_code_challenge/injection_container.dart';
import 'package:keno_code_challenge/presentation/home/bloc/home_page_bloc.dart';
import 'package:keno_code_challenge/presentation/home/widgets/my_appbar.dart';
import 'package:keno_code_challenge/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child: BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
        if (state is HomePageLoading) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ));
        }
        if (state is HomePageFailure) {
          return RefreshWidget();
        }
        if (state is HomePageSuccess) {


          return Scaffold(
              backgroundColor: DefaultColors.appbarColor,
              appBar: MyAppBar(
                totalMoney: state.user.totalMoney,
                numberOfDraws: state.user.numberOfDraws,
              ),
              extendBody: true,
              body: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    Assets.homeScreenImageDark,
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                    bottom: screenHeight / 6,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 16,
                          children: [
                            StrButton(
                                gradient: DefaultColors.blueGradient,
                                text: 'Start Game',
                                onPressed: () {
                                  context.push(Routes.ticketScrren);
                                }),
                          ],
                        )),
                  ),
                ],
              ));
        } else {
          return RefreshWidget();
        }
      }),
    );
  }
}
