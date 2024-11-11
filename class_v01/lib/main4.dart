import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 상태 기반 UI
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 앞으로 MaterialApp 안에서 위젯들을 선언해보자.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.redAccent),
        primarySwatch: Colors.red
      ),
      // 시각적 레이아웃 구성요소를 잡아 주는 녀석이다.
      home: Scaffold(
        appBar: AppBar(title: Text("My Flutter"), backgroundColor: Colors.blue,),
      ),
    );
  }
}