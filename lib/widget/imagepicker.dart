import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickiedImage extends StatefulWidget {
  const PickiedImage({super.key,required this.onTap});
 final void Function(File pickedimagefile)onTap;

  @override
  State<PickiedImage> createState() => _PickiedImageState();
}

class _PickiedImageState extends State<PickiedImage> {
 File? _pikedImageFile;

  void image()async{
   final pickedImage=await ImagePicker().pickImage
   (source: ImageSource.gallery,
    imageQuality: 50,
    maxWidth: 150
    );
    if(pickedImage==null){
      return;
    }
    setState(() {
      _pikedImageFile=File(pickedImage.path);
    });
    widget.onTap(_pikedImageFile!);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          foregroundImage: _pikedImageFile!=null?FileImage(_pikedImageFile!)
                                                :null,
         ),
         TextButton(onPressed: image,
          child: Text('Addimage'))
      ],
    );
  }
}