import 'package:flutter/material.dart';
import 'package:flutter_login/components/Logo.dart';
import 'package:flutter_login/components/custom_text_form_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 처음 const를 붙여서 에러가 나옴 라우터에 따라 화면이 변하기 때문에 const는 붙여선 안된다
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom( // styleFrom 으로 기본적인 스타일을 변경할 수 있다.
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            minimumSize: Size(double.infinity, 60)
          )
        )
      ),
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
  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 확인 -> 상태가 변한다는거니까 const 제거
  // final myController = TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: ListView(
          children: [
            Logo( 'Login'), // 컬럼은 기본 가운데
            Form(
              key: _formKey, // 생성한 final 글로벌 키를 연결한다.
              child: Column(
                children: [
                  SizedBox(height: 10),
                  CustomTextFormField("email"),
                  SizedBox(height: 10),
                  CustomTextFormField("password", isObscure: true),// 밑에서 올라오는 키보드는 인셋이라고 한다.
                  SizedBox(height: 20),
                  TextButton(onPressed: (){
                    if(_formKey.currentState!.validate()) { // null일수가 없기 때문에 !붙여도 에러날 경우의수가 없다.
                      Navigator.pushNamed(context, "/home"); // arm 한계로 그릴거만 다시 그릴 수 있도록 변하는부분만 push로 넣는다. pop일경우 필요없는거를 뺀다.
                    }
                  }, child: Text("Login",
                    style: TextStyle(fontSize: 20),
                  )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Logo("Care Soft"),
              SizedBox(height: 20,),
              TextButton(onPressed: (){}, child: Text("Get Started",
              style: TextStyle(fontSize: 20),)),
            ],
          ),
        )
    );
  }
}


