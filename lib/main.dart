import 'package:flutter/material.dart';
import 'package:flutter_login/components/Logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 처음 const를 붙여서 에러가 나옴 라우터에 따라 화면이 변하기 때문에 const는 붙여선 안된다
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: { // dart의 중괄호는 Map 타입이다. 람다의 특징은 리턴을 한다 -> 표현식이니까
        //     {"id":1, "username":"cos", "password":1234},
        //     {"id":2, "username":"ssar", "password":5678}, 이렇게 map 으로 표현 가능
        "/login": (context) => LoginPage(),  // <- 를 만들어서 `home: LoginPage(),` 를 넣을 필요가 없다 (매핑해줌)
        "/home": (context) => HomePage()
        // login 에서 home 으로 바꾼다면 핫리로드는 안먹힘 완전히 새로 실행시켜야함.. 부분만 수정하는게 아니므로
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Logo(title: 'Login',), // 컬럼은 기본 가운데
          TextFormField(), // 밑에서 올라오는 키보드는 인셋이라고 한다.
          Container(color: Colors.blue, height: 400,)
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.red,),
    );
  }
}


