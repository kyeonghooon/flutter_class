import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// StatefulWidget 클래스 - 상태를 관리 표현
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// 부모 클래스의 상태를 접근 수정 등 역할 수정
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  // 멤버 변수 선언
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 메모리에 올라 갈때 단 한번 호출 되는 메서드
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // 위젯이 제거 될 때 호출 된다.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'HOME'),
              Tab(text: 'Favorites', icon: Icon(Icons.star)),
              Tab(text: 'Settings', icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text('HOME')),
            Center(child: Text('Favorites')),
            Center(child: Text('Settings')),
          ],
        ),
      ),
    );
  }
}
