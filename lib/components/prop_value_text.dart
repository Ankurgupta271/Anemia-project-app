import 'package:flutter/material.dart';

class textProperty extends StatelessWidget {
  final String t;
  final Color c;
  const textProperty({Key? key, required this.t, required this.c}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      t,
      style: TextStyle(
        fontSize: 17,
        fontFamily: 'Montserrat',
        color: c,
      ),
    );
  }
}


class textValue extends StatelessWidget {
  final String t;
  final Color c;
  const textValue({Key? key, required this.t, required this.c}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      t,
      style: TextStyle(
        fontSize: 15,
        fontFamily: 'Montserrat',
        color: c,
      ),
      // overflow: TextOverflow.ellipsis,
      // maxLines: 2,
    );
  }
}


