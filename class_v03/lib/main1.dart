import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('페이지 뷰 위젯 연습'),
        ),
        body: PageView(
          controller: PageController(
            initialPage: 2,
            viewportFraction: 0.5,
          ),
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              color: Colors.redAccent,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              color: Colors.blueGrey,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
