import 'package:flutter/material.dart';

class StrButton extends StatelessWidget {
  const StrButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.gradient,
    this.isActive = true,
  });

  final String text;
  final Function() onPressed;
  final LinearGradient gradient;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 16;
    return Container(
      width: 250,
      height: 38,
      decoration: BoxDecoration(
        boxShadow: isActive ? [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)] : null,
        gradient: isActive ? gradient : null,
        borderRadius: BorderRadius.circular(borderRadius),
        color: isActive ? null : Colors.grey.shade100,
      ),
      child: ElevatedButton(
        onPressed: isActive? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: isActive? Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ) : null,
      ),
    );
  }
}
