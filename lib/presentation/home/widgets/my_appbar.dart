import 'package:flutter/material.dart';
import 'package:keno_code_challenge/core/config/assets.dart';
import 'package:keno_code_challenge/core/theme.dart';
import 'package:lottie/lottie.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.totalMoney,
    required this.numberOfDraws,
  });

  final int totalMoney;
  final int numberOfDraws;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DefaultColors.appbarColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                alignment: Alignment.center,
                repeat: true,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                Assets.coinAnimation,
              ),
              Text(
                totalMoney.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          Text(
            'Game played: $numberOfDraws',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
