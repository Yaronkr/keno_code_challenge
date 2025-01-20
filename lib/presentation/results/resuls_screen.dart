import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keno_code_challenge/core/shared_ui/str_button.dart';
import 'package:keno_code_challenge/core/theme.dart';
import 'package:keno_code_challenge/core/utils/game_helper.dart';
import 'package:keno_code_challenge/presentation/results/bloc/results_bloc.dart';
import 'package:keno_code_challenge/presentation/results/widgets/draw_numbers_container.dart';
import 'package:keno_code_challenge/presentation/results/widgets/results_container.dart';
import 'package:keno_code_challenge/presentation/results/widgets/user_numbers_container.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.userNumbers,
  });
  final List<int> userNumbers;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultsBloc()..add(DrawStarted(userNumbers: userNumbers)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Lottery Draw ',
          ),
        ),
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double containerWidth = constraints.maxWidth > 300 ? 300 : constraints.maxWidth - 32;
              double containerHeight = constraints.maxHeight > 600 ? 600 : constraints.maxHeight - 32;

              return BlocBuilder<ResultsBloc, ResultsState>(
                builder: (context, state) {
                  final bloc = context.read<ResultsBloc>();

                  return Container(
                    width: containerWidth,
                    height: containerHeight,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: DefaultColors.white,
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: (state is LoadingState || state is DrawStartedState)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: GameHelper.getWidgetSpacing(),
                              children: [
                                if (bloc.userNumbers.isNotEmpty) ...{
                                  UserNumbersContainer(),
                                },
                                DrawNumbersContainer(),
                                ResultsContainer(),
                                if (state is DrawEndedState) ...{
                                  StrButton(
                                      gradient: DefaultColors.blueGradient,
                                      text: 'Back To Home Page',
                                      onPressed: () {
                                        context.pop();
                                      }),
                                }
                              ],
                            ),
                          ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
