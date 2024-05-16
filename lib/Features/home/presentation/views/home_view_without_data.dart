import 'package:flutter/material.dart';

class HomeViewWithoutData extends StatelessWidget {
  const HomeViewWithoutData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There is no weather, Start searching now 🔍',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
