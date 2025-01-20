import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:keno_code_challenge/presentation/home/bloc/home_page_bloc.dart';
import 'package:keno_code_challenge/routing/router.dart';
import 'package:keno_code_challenge/core/theme.dart';
import 'package:keno_code_challenge/injection_container.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeDependencies();
  FlutterNativeSplash.remove();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageBloc>(
        create: (context) => sl()..add(LoadUserData()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.system,
          routerConfig: router(),
        ));
  }
}
