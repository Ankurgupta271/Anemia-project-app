import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final int? color;
  final int? highlight;
  final double? width;
  final double? w;
  final int? textColor;

  LoginButton(
      {required this.text,
        required this.onPress,
        this.highlight,
        this.width,
        this.w,
        this.color,
        this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Color(highlight!),
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: w! - 100,
        height: MediaQuery.of(context).size.height / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color:  Colors.white38,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color: Color(color!),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              //fontFamily: ,
              color: Color(textColor!),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
