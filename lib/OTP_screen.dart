import 'dart:io';
import 'dart:ui';
import 'dart:core';
import 'package:cupertino_text_button/cupertino_text_button.dart';
import 'components/login_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class otpScreen extends StatelessWidget {
  static const String id = '/otp';
  const otpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100, left: 30),
              child: Text(
                'Confirm OTP Code',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Roboto-Medium',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    height: 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 35, right: 30, bottom: 35),
              child: Text(
                'Enter OTP code which was sent via SMS to your registered mobile number.',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto-Medium',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    height: 1),
              ),
            ),
            Container(
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: _textFieldOTP(
                            context: context, first: true, last: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: _textFieldOTP(
                            context: context, first: false, last: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: _textFieldOTP(
                            context: context, first: false, last: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: _textFieldOTP(
                            context: context, first: false, last: true),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        const Text(
                          'Haven\'t received the OTP yet?  ',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                          ),
                        ),
                        CupertinoTextButton(
                          text: 'Resend OTP.',
                          color: Colors.blue,
                          style: const TextStyle(
                            fontSize: 15,
                            letterSpacing: 1,
                          ),
                          onTap: () {
                            // Do your text stuff here.
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75),
                    child: LoginButton(
                      text: "Confirm OTP",
                      onPress: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      w: MediaQuery.of(context).size.width - 10,
                      color: 0xff6F8EFC,
                      textColor: 0xFFffffff,
                      highlight: 0xff451EB7,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldOTP(
      {required BuildContext context,
      required bool first,
      required bool last}) {
    return Container(
      height: 85,
      width: 70,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xff45539F)),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
