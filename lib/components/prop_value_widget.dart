import 'package:flutter/material.dart';

class propValueWidget extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  const propValueWidget({Key? key, required this.widget1, required this.widget2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget1,
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: widget2,
        )
      ],
    );
  }
}
