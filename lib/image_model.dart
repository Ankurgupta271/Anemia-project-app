import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/ImageListTile.dart';

class Image_Model extends StatelessWidget {
  String imagePath;
  String caller;
  String text;
  int c;
  late VoidCallback onPress;

  Image_Model({
    required this.imagePath,
    required this.text,
    required this.caller,
    required this.c, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyImageModel(
        imagePath: imagePath,
        text: text,
        caller: caller,
        c: c,
      ),
      child: ImageListTile(
          onPress: onPress,
        ),
    );
  }
}