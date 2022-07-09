import 'package:bmiapperkey/constants/app_constants.dart';
import 'package:bmiapperkey/widgets/left_bar.dart';
import 'package:bmiapperkey/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "...bmi calculator...",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 169,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.9),
                        )),
                  ),
                ),
                Container(
                  width: 169,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.9),
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 31,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "u gotta lose some weight my dude";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "hmm not bad not bad i see u ";
                  } else {
                    _textResult =
                        " somebody put that sceletton back to the grave ";
                  }
                });
              },
              child: Text(
                "hesafla blet",
                style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor),
              ),
            ),
            SizedBox(
              height: 69,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accentHexColor),
              ),
            ),
            SizedBox(
              height: 31,
            ),
            Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                  child: Text(
                    _textResult,
                    style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.w500,
                        color: accentHexColor),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 50,
            ),
            RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
