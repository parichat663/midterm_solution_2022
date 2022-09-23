import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_solution_2022/pages/home/home_page.dart';
import 'package:midterm_solution_2022/pages/main/main_page.dart';
import 'package:midterm_solution_2022/pages/utils/helpers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _input = '';
  //var _massage = '';

  Widget _buildIndicator(bool on) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFF067922),
              width: 1.0,
            ),
            color: on ? Color(0xFF067922) : Colors.transparent),
      ),
    );
  }

  void _handleClickButton(int num){
    const password = '123456';

    setState(() {
      if(num == -1){
        _input = _input.substring(0, _input.length - 1);
      }
      else{
        _input = _input + num.toString();
      }
    });

    if(_input.length == 6){
      if(_input == password){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage())
        );
        setState(() {
          //_massage = 'Welcome To Mobile App!';
        });
      }
      else{
        showMyDialog(context, 'Sorry', 'Incorrect PIN. Please try again.');
        setState(() {
          //_massage = 'Password is not Correct, Please Try Again!';
        });
      }
    };
 }

  Widget _buildNumberButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        //ค่าที่เอามาใส่ใน onTap ต้องเป็น function (callback function, event listener/bandler)
        onTap: () {
          setState(() {
            _handleClickButton(num);
          });
        },
        customBorder: CircleBorder(),
        child: Container(
          width: 60.0,
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: num != -1
                ? Border.all(
                    color: Color(0xFFCCCCCC),
                    width: 1.0,
                  )
                : null,
          ),
          child: num == -1
              ? Icon(Icons.backspace_outlined)
              : Text(
                  num.toString(),
                  style: GoogleFonts.roboto(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }

  /*
  * //การสร้าง function ในรูปแบบ function declaration (การสร้างแบบปกติ)
  * void func1(){
  * //
  * }
  *
  * //การสร้าง function ในรูปแบบ function expression (การสร้างแบบนิพจน์ function กำหนดตัวแปลเป็น function)
  *
  * var func2 = (){
  * //
  * }
  *
  * void func3(){
  *   func1();
  *   func2();
  *   var f = func2;
  *   f();
  * }
  *
  * var myList1 = <Widget>[];
  * for(var i = 1; i <= 3; i++){
  *   myList.add(_buildNumberButton(i));
  * }
  *
  * //ถ้าใช้ collection for (เขียนใน list) ไม่ต้องใส่ ()/ใต้ for ใส่ได้แค่บรรทัดเดียว
  * children: [ //list literal
  *   for(var i = 1; i <= 3; i++)
  *     _buildNumberButton(i)
  * ]
  *
  * var status = false;
  * var list = [
  *   0,
  *   for(var i = 1; i <= 100; i++)
  *     i,
  *   if(status) 104,
  * ]
  *
  * //space operator (...)
  * var myList2 = [0, ...myList1, 4, 5, 6]; //ก๊อป list ที่เคยสร้างไว้แล้วมา
  * var myList3 = [...myList1, ...myList2];
  *
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/KPlus_logo.png',
            width: 120.0,
          ),
          Text('Please Enter Your PIN'),
          SizedBox(height: 16.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIndicator(_input.length >= 1 ? true : false),
              _buildIndicator(_input.length >= 2 ? true : false),
              _buildIndicator(_input.length >= 3 ? true : false),
              _buildIndicator(_input.length >= 4 ? true : false),
              _buildIndicator(_input.length >= 5 ? true : false),
              _buildIndicator(_input.length >= 6 ? true : false),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Column(
            children: [
              for (var row in [
                [1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]
              ])
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i in row) _buildNumberButton(i),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 76.0,
                    height: 76.0,
                  ),
                  _buildNumberButton(0),
                  _buildNumberButton(-1),
                ],
              )
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(1),
                  _buildNumberButton(2),
                  _buildNumberButton(3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(4),
                  _buildNumberButton(5),
                  _buildNumberButton(6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(7),
                  _buildNumberButton(8),
                  _buildNumberButton(9),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(0),
                  //Text('⌫'),
                ],
              )*/
            ],
          ),
          //Text(_input),
          //Text(_massage),
          const Text(
            'Forget your PIN',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Color(0xFF30BD71),
            ),
          ),
        ],
      ),
    );
  }
}
