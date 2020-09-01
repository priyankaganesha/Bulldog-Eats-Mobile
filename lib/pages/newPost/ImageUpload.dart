import 'package:flutter/material.dart';

class ImageUpload extends StatefulWidget {
  ImageUpload({Key key}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
    );
  }
}
