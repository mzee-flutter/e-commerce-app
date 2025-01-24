import 'package:flutter/material.dart';

class container extends StatelessWidget {
  static const String id = 'container';

  const container({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: 100,
        width: 100,
        color: Colors.black,
      ),
    );
  }
}
