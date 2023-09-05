import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ImageListTile.dart';

class image extends StatelessWidget {
  double w;
  double h;

  image({required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyImageModel>(
      builder: (context, model, _) {
        final file = File(model.imagePath);
        return Container(
          width: w,
          height: h,
          child: Image.file(
            file,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
