import 'package:flutter/material.dart';

class CustomBackgroundWidget extends StatelessWidget {
  final Widget? child;

  const CustomBackgroundWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.transparent,
          image: DecorationImage(
        image: AssetImage("assets/images/pattern.png"),
        fit: BoxFit.cover,
      )),
      child: child,
    );
  }
}
