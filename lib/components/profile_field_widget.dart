import 'package:flutter/material.dart';

class profileField extends StatefulWidget {
  final Widget w;
  const profileField({Key? key, required this.w}) : super(key: key);

  @override
  State<profileField> createState() => _profileFieldState();
}

class _profileFieldState extends State<profileField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.2,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 23),
      padding: EdgeInsets.symmetric(horizontal: 40),
      decoration: const BoxDecoration(
        borderRadius : BorderRadius.all(Radius.circular(30),),
        boxShadow : [BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(2,2),
            blurRadius: 4
        )],
        color : Color.fromRGBO(255, 255, 255, 1),
      ),
      child: widget.w,
    );
  }
}
