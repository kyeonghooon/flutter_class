import 'package:flutter/material.dart';

void main() {
  runApp(MyHome2());
}

class MyHome2 extends StatelessWidget {
  const MyHome2({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0; // 기본 탭 인덱스, 변경되지 않습니다.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("tencoding"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
          ],
          leading: PopupMenuButton<String>(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '정자동', // 선택할 수 있는 기본 위치 이름
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.arrow_drop_down, // 아래 방향 화살표 아이콘
                  color: Colors.white,
                ),
              ],
            ),
            tooltip: '위치 선택', // 버튼의 힌트 텍스트
            onSelected: (String value) {
              print('$value 선택됨');
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: '정자동',
                child: Text('정자동'),
              ),
              PopupMenuItem<String>(
                value: '판교동',
                child: Text('판교동'),
              ),
              PopupMenuItem<String>(
                value: '서현동',
                child: Text('서현동'),
              ),
              PopupMenuItem<String>(
                value: '이매동',
                child: Text('이매동'),
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('현재 선택된 탭: ${_currentIndex + 1}'), // 선택된 탭은 고정된 상태
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 아이템이 4개 이상일 때는 fixed로 설정
          currentIndex: _currentIndex, // 현재 선택된 인덱스 (고정)
          onTap: (index) {
            // 탭을 선택해도 실제 상태는 업데이트되지 않음
            print('탭 $index 선택됨'); // 콘솔에 선택된 탭을 출력
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈', // 아이콘 아래에 표시할 텍스트
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '검색',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '알림',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: '메시지',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '프로필',
            ),
          ],
        ),
      ),
    );
  }
}
