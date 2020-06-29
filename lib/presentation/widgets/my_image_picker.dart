import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:image_picker_web/image_picker_web.dart';

class MyImagePicker extends StatefulWidget {
  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    if (kIsWeb) {
      // Uint8List fromPicker =
      //     await ImagePickerWeb.getImage(outputType: ImageType.bytes);

      // if (fromPicker != null) {
      //   setState(() {
      //     _image = File.fromRawPath(fromPicker);
      //   });
      // }
    } else {
      final pickedFile = await picker.getImage(source: ImageSource.camera);

      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getImage,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 100 * 30,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: _image == null
                ? _plusIconedButton()
                : Image.file(_image, fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }

  Widget _plusIconedButton() => Container(
        width: 64.0,
        height: 64.0,
        decoration: BoxDecoration(
          // color: Colors.grey,
          border: Border.all(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.grey,
            size: 48.0,
            semanticLabel: 'No image selected.',
          ),
        ),
      );
}
