import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Dynamic Form'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hello'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
