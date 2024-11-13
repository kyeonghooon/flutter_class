import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Statefulwidget에 연계된 클래스가 State 클래스이다.
class _MyHomePageState extends State<MyHomePage> {
  // 통신 --> 통신 클라이언트 클래스가 필요하다.
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    // 통신 요청 함수 호출
    _fetchTodos();
  }

  // 화면을 그려주는 함수
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  // 통신을 담당하는 함수 --> MVC --> MVVM --> MVVM + 클린아키텍쳐
  Future<void> _fetchTodos() async {
    // 통신코드 작성시 반드시 --> 예외 처리 코드

    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/todos/1');
      print('HTTP status code : ${response.statusCode}');
      print('서버에서 전달 된 데이터 확인 : ${response.data}');
      print('데이터 타입 확인 dart 언어에서 : ${response.data.runtimeType}');

      print('---------------------------------------------------------');
      print(' 넘겨 받은 _JsonMap 구조에서 속성 값 확인1 : ${response.data['userId']}');
      print(' 넘겨 받은 _JsonMap 구조에서 속성 값 확인2 : ${response.data['title']}');
      print('---------------------------------------------------------');
      // response.data에서 ----> Todo 객체를 만드는 것이 목표
      // Todo newTodo = new Todo();
      Todo newTodo = Todo(
        userId: response.data['userId'],
        id: response.data['id'],
        title: response.data['title'],
        completed: response.data['completed'],
      );
      // newTodo.userId = response.data['userId'];
      // newTodo.id = response.data['id'];
      // newTodo.title = response.data['title'];
      // newTodo.completed = response.data['completed'];

      print('인스턴스 값 뿌려 보기1 : ${newTodo.toString()}');
      print('인스턴스 값 뿌려 보기1 : ${newTodo.id}');
    } catch (e) {
      print('네트워크 오류 발생 또는 파싱 오류 발생...  : ${e.toString()}');
    }
  }
}

class Todo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  // {} 생성자 옵셔널은 말 그대로 옵션값이다.
  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}
