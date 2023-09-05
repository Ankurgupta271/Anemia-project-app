import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:core';

class checkResults extends StatefulWidget {
  checkResults({Key? key}) : super(key: key);

  @override
  State<checkResults> createState() => _checkResultsState();
}

class _checkResultsState extends State<checkResults> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.only(left: 18, right: 20, top: 40, bottom: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        children: [
          Container(
            width: 6* MediaQuery.of(context).size.width /7 ,
            height: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xff6F8EFC),
              image: DecorationImage(
                image: AssetImage('assets/images/vector.png'),
                scale: 0.2,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top:30,
            left:13,
            child: Text(
              'Check Previous Results',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Roboto-Medium',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1),
            ),
          ),
          Positioned(
            top:50,
            right: 1,
            child: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 30,
                color: Color(0xFFffffff),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
