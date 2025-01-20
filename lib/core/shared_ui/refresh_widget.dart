import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keno_code_challenge/presentation/home/bloc/home_page_bloc.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: IconButton(
            iconSize: 32,
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.refresh),
            onPressed: () {
              context.read<HomePageBloc>().add(LoadUserData());
            },
          ),
        ));
  }
}
