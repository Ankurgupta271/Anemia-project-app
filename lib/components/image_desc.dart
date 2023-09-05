import 'dart:io';
import 'package:flutter/material.dart';

class img extends StatefulWidget {
  File file;
  String text;
  int maxLines;

  img({required this.file,required this.text,required this.maxLines}) ;

  @override
  State<img> createState() => _imgState();
}

class _imgState extends State<img> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            width: 80,
            height: 80,
            child: Image.file(
              widget.file,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 2),
          width: 80,
          child: Text(
            widget.text,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.ltr,
          ),
        ),
      ]
    );
  }
}
