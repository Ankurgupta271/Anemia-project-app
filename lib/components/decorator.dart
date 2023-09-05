import 'package:flutter/material.dart';

class container extends StatelessWidget {
  final Color color_;
  const container({Key? key,required this.color_}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:20),
      height: 35,
      width: 35,
      decoration:BoxDecoration(
        color: color_,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

