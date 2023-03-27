import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {

  final title; // 이것의 의도는 변하지 않는 글자이기 때문에 String -> final로 변경

  // Logo({required this.title ,Key? key}) : super(key: key); // key는 리스트의 위치를 바꾸는데 필요하다고 함..
  Logo(this.title,{Key? key}) : super(key: key); // 시그니처로 사용할 경우 .. 시그니처는 하나만 변하게 하고 싶을때 사용한다

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/logo.svg", height: 70, width: 70),
        Text(title,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)
      ],
    );
  }
}
