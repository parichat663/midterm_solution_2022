import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/my_converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const lebelList = [
    'Celsius to Fahrenheit',
    'Celsius to Kelvin',
    'Fahrenheit to Celsius',
    'Fahrenheit to Kelvin',
    'Kelvin to Celsius',
    'Kelvin to Fahrenheit',
  ];

  var _feedbackText = '';
  final _controller = TextEditingController();

  void _handleClickButton(int i){
    print('Button Click!');
    switch(i){
      case 0:
        //setState() จะทำการรีหน้า ui ของเรา
        setState(() {
          var input = _controller.text;
          var temp = double.tryParse(input);
          if(temp == null){
            _feedbackText = 'Error!, Please Try Again';
          }
          else{
            _feedbackText = ' $temp Celsius To ${MyConverter.C2F(temp)} Fahrenheit';
          }
        });
        break;
      case 1:
        setState(() {
          var input = _controller.text;
          var temp = double.tryParse(input);
          if(temp == null){
            _feedbackText = 'Error!, Please Try Again';
          }
          else{
            _feedbackText = ' $temp Celsius To ${MyConverter.C2K(temp)} Kelvin';
          }
        });
        break;
      case 2:
        setState(() {
          var input = _controller.text;
          var temp = double.tryParse(input);
          if(temp == null){
            _feedbackText = 'Error!, Please Try Again';
          }
          else{
            _feedbackText = ' $temp Fahrenheit To ${MyConverter.F2C(temp)} Celsius';
          }
        });
        break;
      case 3:
        setState(() {
          var input = _controller.text;
          var temp = double.tryParse(input);
          if(temp == null){
            _feedbackText = 'Error!, Please Try Again';
          }
          else{
            _feedbackText = ' $temp Fahrenheit To ${MyConverter.F2K(temp)} Kelvin';
          }
        });
        break;
      case 4:
        setState(() {
          var input = _controller.text;
          var temp = double.tryParse(input);
          if(temp == null){
            _feedbackText = 'Error!, Please Try Again';
          }
          else{
            _feedbackText = ' $temp Kelvin To ${MyConverter.K2C(temp)} Celsius';
          }
        });
        break;
      case 5:
        setState(() {
          var input = _controller.text;
          var temp = double.tryParse(input);
          if(temp == null){
            _feedbackText = 'Error!, Please Try Again';
          }
          else{
            _feedbackText = ' $temp Kelvin To ${MyConverter.K2F(temp)} Fahrenheit';
          }
        });
        break;
    }
  }

  //name: _abc --> private of class
  Widget _buildButton(int i) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: (){
          _handleClickButton(i);
        },
        child: Text(lebelList[i]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    /*var myList = [
      ['Celsius to Fahrenheit', 'Celsius to Kelvin'],
      ['Fahrenheit to Celsius', 'Fahrenheit to Kelvin'],
      ['Kelvin to Celsius', 'Kelvin to Fahrenheit'],
    ];*/

    return Scaffold(
      appBar: AppBar(
        title : Text('Midterm Exam Solution',
          style: GoogleFonts.chakraPetch(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          //fontStyle: FontStyle.italic
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //font android = Thai --> 'roboto'
            Text('Temperature Converter',
              style: GoogleFonts.chakraPetch(
                  fontSize: 30.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                  //fontStyle: FontStyle.italic
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 20.0
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 5.0,
                  color: Colors.deepPurple.shade200,
                ),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0,3),
                  )
                ]
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _controller,
                      style: GoogleFonts.chakraPetch(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a temperature value to convert',
                      ),
                    ),
                  ),
                  /*for(var r in myList)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(var i in r)
                            _buildButton(i, ____),
                        ],
                    ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(0),
                      _buildButton(1),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(2),
                      _buildButton(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(4),
                      _buildButton(5),
                    ],
                  ),
                  SizedBox(height: 16.0,),
                ],
              ),
            ),
            Text(_feedbackText, style: GoogleFonts.chakraPetch(fontSize: 20.0),),
          ],
        ),
      ),
    );
  }
}
