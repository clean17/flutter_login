import 'package:flutter/material.dart';
import 'package:flutter_login/components/my_input_decoration.dart';

class CustomTextFormField extends StatelessWidget {
  final title;
  // final bool? isObscure; // bool 은 물음표 안붙이면 오류,, final은 안나지만 선택적 매개변수는 타입을 지정해주라고 하심
  final isObscure; // 디폴트값 false로 변경후 널 허용 제거
  const CustomTextFormField(this.title, {this.isObscure = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextFormField(
          validator: (value) => // validator 가 입력된 모든 데이터를 가져옴
            value!.isEmpty ? "Please enter some text" : null // 유효성 통과하면 null 리턴
          ,
          // onChanged: (text){
          //   print(text); // 입력되면 콘솔에 나옴
          // },
          obscureText: isObscure,
          decoration: MyInputDecoration(
            "Enter $title" // 변수 하나만 바인딩 한다면 중괄호가 굳이 필요없다.
        ),
        ),
      ],
    );
  }
}
