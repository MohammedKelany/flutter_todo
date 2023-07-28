import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 1,
      child: ColoredBox(
        color: Colors.black12,
      ),
    );
  }
}
