import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('There is no weather 😔', style: TextStyle(fontSize: 25)),
          Text('start searching 🔍', style: TextStyle(fontSize: 25)),
        ],
      ),
    );
  }
}
