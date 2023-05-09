import 'dart:io';

import 'package:flutter/material.dart';

Widget ShowImageWidget (File? imageFile){
  if(imageFile != null){
    return Image.file(
      imageFile,
      width: 250,
      height: 250,
      fit: BoxFit.cover,
    );
  } else {
    return Image.asset(
      'assets/images/ios.jpg',
      width: 250,
      height: 250,
      fit: BoxFit.cover,
    );
  }
}