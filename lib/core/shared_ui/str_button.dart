import 'package:flutter/material.dart';

class StrButton extends StatelessWidget {
  const StrButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.gradient,
  });

  final String text;
  final Function() onPressed;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 16;
    return Container(
      width: 250,
      height: 38,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)],
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
