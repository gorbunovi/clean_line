import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Widget GetImageWigdget({required Function getImage}){

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
        onPressed: () => getImage(ImageSource.camera),
        child: const Icon(Icons.camera_alt_outlined, color: Colors.black),
      ),
      ElevatedButton(
          onPressed: () => getImage(ImageSource.gallery),
          child: const Icon(Icons.photo_library_outlined),
      ),
    ],
  );
}