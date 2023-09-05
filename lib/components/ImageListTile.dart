import 'dart:io';
import 'package:anemia_project_app/components/image_desc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_button.dart';

class MyImageModel extends ChangeNotifier {
  String imagePath;
  String caller;
  String text;
  int c;

  MyImageModel({
    required this.imagePath,
    required this.text,
    required this.caller,
    required this.c,
  });

  void updateImagePath(String newPath) {
    imagePath = newPath;
    notifyListeners();
  }
}

class ImageListTile extends StatelessWidget {
  final VoidCallback onPress;

  ImageListTile({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyImageModel>(
      builder: (context, model, child) {
        return FutureBuilder<FileSystemEntity>(
          future: Future.value(File(model.imagePath)),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final file = snapshot.data as File;
              print("File path: ${file.path}");
              if (file.existsSync()) {
                return Container(
                  height: 100,
                  margin: EdgeInsets.only(top: 15, left: 20, right: 35, bottom: 20),
                  child: Row(
                    children: [
                      img(
                        file: file,
                        text: model.imagePath,
                        maxLines: 1,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 2, bottom: 10),
                        child: LoginButton(
                          text: model.text,
                          onPress: onPress,
                          w: MediaQuery.of(context).size.width - 90,
                          color: model.c,
                          textColor: 0xFFffffff,
                          highlight: 0xff451EB7,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                print("File does not exist");
                return Text("Error loading image");
              }
            } else if (snapshot.hasError) {
              print("Future error: ${snapshot.error}");
              return Text("Error loading image");
            } else {
              return SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}






