import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keno_code_challenge/core/shared_ui/str_button.dart';
import 'package:keno_code_challenge/core/theme.dart';
import 'package:keno_code_challenge/presentation/ticket/bloc/ticket_cubit.dart';
import 'package:keno_code_challenge/presentation/ticket/widgets/numbers_container.dart';
import 'package:keno_code_challenge/routing/routes.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TicketCubit(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'My Ticket',
            ),
          ),
          body: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double containerWidth = constraints.maxWidth > 300 ? 300 : constraints.maxWidth - 32;
                double containerHeight = constraints.maxHeight > 600 ? 600 : constraints.maxHeight - 32;

                return BlocBuilder<TicketCubit, List<int>>(
                  builder: (context, numbers) {
                    double numberBoxWidth = (containerWidth - 32 - 16) / 5;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 32,
                      children: [
                        Container(
                          width: containerWidth,
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Choose Your Numbers',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Divider(height: 0),
                              NumbersContainer(
                                numbers: numbers,
                                numberBoxWidth: numberBoxWidth,
                              ),
                              const SizedBox(height: 16),
                              StrButton(
                                text: 'Shuffle',
                                gradient: DefaultColors.orangeGradient,
                                onPressed: () => context.read<TicketCubit>().shuffleNumbers(),
                              ),
                            ],
                          ),
                        ),
                        StrButton(
                          text: 'Play',
                          gradient: DefaultColors.blueGradient,
                          onPressed: () => context.replace(Routes.resultsScreen, extra: numbers),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}
