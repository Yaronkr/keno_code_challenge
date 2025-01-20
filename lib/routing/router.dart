import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:keno_code_challenge/presentation/home/home_screen.dart';
import 'package:keno_code_challenge/presentation/results/resuls_screen.dart';
import 'package:keno_code_challenge/presentation/ticket/ticket_screen.dart';
import 'routes.dart';

GoRouter router() => GoRouter(
      initialLocation: Routes.home,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            return HomeScreen();
          },
          routes: [
            GoRoute(
              path: Routes.ticketScrren,
              builder: (context, state) {
                return TicketScreen();
              },
            ),
            GoRoute(
              path: Routes.resultsScreen,
              builder: (context, state) {
                List<int> numbers = state.extra as List<int>;
                return ResultsScreen(userNumbers: numbers,);
              },
            ),
          ],
        ),
      ],
    );
