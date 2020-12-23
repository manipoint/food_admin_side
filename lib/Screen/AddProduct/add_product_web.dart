import 'package:flutter/material.dart';
import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';

class AddProductWeb extends StatefulWidget {
  @override
  _AddProductWebState createState() => _AddProductWebState();
}

class _AddProductWebState extends State<AddProductWeb> {
  Image image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: OutlineButton(
              onPressed: () async {
                final _image = await FlutterWebImagePicker.getImage;
                setState(() {
                  image = _image;
                });
              },
              child: image != null
                  ? image
                  : Icon(Icons.add_a_photo_outlined),
            ),
          ),
        ],
      )),
    );
  }

  
}
