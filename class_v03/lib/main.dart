import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('그리드뷰 위젯 연습'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 36,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blueGrey,
              child: Text('index number : $index'),
            );
          },
        ),
      ),
    );
  }
}
