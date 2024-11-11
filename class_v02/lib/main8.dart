import 'package:flutter/material.dart';

void main() {
  runApp(MyApp8());
}

class MyApp8 extends StatefulWidget {
  const MyApp8({super.key});

  @override
  State<MyApp8> createState() => _MyApp8State();
}

class _MyApp8State extends State<MyApp8> {
  // Form 위젯 만들어 보기

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _errorMessage = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TextFormField --> vaildator 호출 --> 모두 통과 하면 true를 반환한다.

      // 다음단계 --> onSaved 메서드를 실행시킨다.
      _formKey.currentState!.save(); // 각각의 formfield onSaved 메서드 호출됨
      setState(() {
        _errorMessage = ''; // 상태 변경 처리
        // 변수안의 값 확인 -->
        print('_name : $_name');
        print('_email : $_email');
        print('_password : $_password');

        // 통신 요청
      });
    } else {
      setState(() {
        _errorMessage = '필수 값들을 입력하시오';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form example'),
        ),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            // form 위젯은 위젯들을 구분할 수 있는 키가 필요하다.
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'name',
                      errorStyle: TextStyle(color: Colors.blue, fontSize: 10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이름을 입력하세요';
                      }
                      return null;
                    },
                    // value 매개변수 값이 null이 될 수 있다.
                    onSaved: (value) {
                      // value! 강제 null 아니라고 명시
                      _name = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'email',
                      errorStyle: TextStyle(color: Colors.blue, fontSize: 10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이메일을 입력하세요';
                      }
                      return null;
                    },
                    // value 매개변수 값이 null이 될 수 있다.
                    onSaved: (value) {
                      // value! 강제 null 아니라고 명시
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'password',
                      errorStyle: TextStyle(color: Colors.blue, fontSize: 10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력하세요';
                      }
                      return null;
                    },
                    // value 매개변수 값이 null이 될 수 있다.
                    onSaved: (value) {
                      // value! 강제 null 아니라고 명시
                      _password = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: _submitForm, child: Text('submit')),
                  const SizedBox(height: 20),
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
