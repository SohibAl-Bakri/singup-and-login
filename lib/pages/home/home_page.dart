import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'components/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
        foregroundColor: Colors.lightBlue.shade400,
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome to Home Page',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Icon(
              Ionicons.heart_circle_outline,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
